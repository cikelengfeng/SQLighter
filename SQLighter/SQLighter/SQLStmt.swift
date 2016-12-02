import Foundation

public struct SQLStmt: ExpressibleByArrayLiteral {
    
    fileprivate let baseSQL: String
    fileprivate let baseParams: [FMDBConvertable]
    
    public init(_ sql: String, params: [FMDBConvertable]) {
        self.baseSQL = sql
        self.baseParams = params
    }
    
    public init() {
        self.init("", params: [])
    }
    
    public init(_ sql: String) {
        self.init(sql, params: [])
    }
    
    public init(arrayLiteral elements: SQLStmt...) {
        if elements.count == 0 {
            self.init()
            return
        }
        var stmt = SQLStmt()
        if elements.count == 1 {
            stmt = stmt.append(elements[0])
        } else {
            stmt = stmt.append(ENCLOSED(AND_JOINED(elements)))
        }
        self.init(stmt.baseSQL, params: stmt.baseParams)
    }
    
    public func assemble() -> String {
        return baseSQL
    }
    
    public func parameters() -> [AnyObject] {
        return self.baseParams.map { $0.toAnyObject() }
    }
    
    public func append(_ child: SQLStmt) -> SQLStmt {
        var sql = ""
        if self.baseSQL.characters.count * child.baseSQL.characters.count == 0 {
            sql = self.baseSQL + child.baseSQL
        }else {
            sql = self.baseSQL + " " + child.baseSQL
        }
        return SQLStmt(sql, params: self.baseParams + child.baseParams)
    }
    
    public func append(_ sqls: [SQLStmt]) -> SQLStmt {
        var ret = SQLStmt(self.baseSQL, params: self.baseParams)
        for sql in sqls {
            ret = ret.append(sql)
        }
        return ret
    }
    
    public func append(_ pureSQL: String) -> SQLStmt {
        let pureSQL = SQLStmt(pureSQL, params: [])
        return append(pureSQL)
    }
    
    public func append(_ pureSQL: String, params: [FMDBConvertable]) -> SQLStmt {
        let pureSQL = SQLStmt(pureSQL, params: params)
        return append(pureSQL)
    }
    
    fileprivate func estimateRetainCycleAfterAppend(_ sql: SQLStmt) -> Bool {
        //TODO: impl
        return false
    }
}

public extension SQLStmt {
    
    public func where_(_ expressions: SQLStmt...) -> SQLStmt {
        return append("WHERE").append(AND_JOINED(expressions))
    }
    
    public func not() -> SQLStmt {
        return append("NOT")
    }
    
    public func is_() -> SQLStmt {
        return append("IS")
    }
    
    public func null() -> SQLStmt {
        return append("NULL")
    }
    
    public func in_(paramArr params: [FMDBConvertable]) -> SQLStmt {
        return append("IN").append(ENCLOSED(SQLStmt((params.map() {_ in "?"}).joined(separator: " , "), params: params)))
    }
    
    public func in_(_ params: FMDBConvertable...) -> SQLStmt {
        return in_(paramArr: params)
    }
    
    public func in_(_ expr: SQLStmt) -> SQLStmt {
        return append("IN").append(ENCLOSED(expr))
    }
    
    public func like() -> SQLStmt {
        return append("LIKE")
    }
    
    public func like(_ value: FMDBConvertable) -> SQLStmt {
        return like().value(value)
    }
    
    public func like(_ expr: SQLStmt) -> SQLStmt {
        return like().append(expr)
    }
    
    public func glob() -> SQLStmt {
        return append("GLOB")
    }
    
    public func glob(_ value: FMDBConvertable) -> SQLStmt {
        return glob().value(value)
    }
    
    public func glob(_ expr: SQLStmt) -> SQLStmt {
        return glob().append(expr)
    }
    
    public func match() -> SQLStmt {
        return append("MATCH")
    }
    
    public func match(_ value: FMDBConvertable) -> SQLStmt {
        return match().value(value)
    }
    
    public func match(_ expr: SQLStmt) -> SQLStmt {
        return match().append(expr)
    }
    
    public func regex() -> SQLStmt {
        return append("REGEXP")
    }
    
    public func regex(_ value: FMDBConvertable) -> SQLStmt {
        return regex().value(value)
    }
    
    public func regex(_ expr: SQLStmt) -> SQLStmt {
        return regex().append(expr)
    }
    
    public func id(_ id: String) -> SQLStmt {
        return append("\"\(id)\"", params: [])
    }
    
    public func value(_ v: FMDBConvertable) -> SQLStmt {
        return append("?", params: [v])
    }
}

public extension SQLStmt {
    
    public func update() -> SQLStmt {
        return append("UPDATE")
    }
    
    public func table(_ name: String) -> SQLStmt {
        return append(ID(name))
    }
    
    public func columns(_ columns: [String]) -> SQLStmt {
        let sqls: [SQLStmt] = ((columns.enumerated().map { (index, val) -> [SQLStmt] in
            if index + 1 == columns.count {
                return [ID(val)]
            }
            return [ID(val),SQLStmt(",")]
        }).flatMap { $0 })
        return append(ENCLOSED(sqls))
    }
    
    public func set(_ dict: [String: FMDBConvertable]) -> SQLStmt {
        let sql = (dict.keys.map { column in
            return "\"\(column)\" = ?"
        }).joined(separator: " , ")
        let params = Array(dict.values)
        return append("SET").append(sql, params: params)
    }
    
    public func set(_ dict: (SQLStmt, FMDBConvertable)...) -> SQLStmt {
        let sql = (dict.map { (column, value) -> String in
            return "\(column.baseSQL) = ?"
        }).joined(separator: " , ")
        let params = (dict.map({ (column, value) -> [FMDBConvertable] in
            return column.baseParams + [value]
        })).flatMap { $0 }
        return append("SET").append(sql, params: params)
    }
    
}

public enum Order: String {
    case DESC = "DESC"
    case ASC = "ASC"
    case COLLATE_NOCASE = "COLLATE NOCASE"
}

public extension SQLStmt {
    
    public func select(columnArr columns: [String]) -> SQLStmt {
        return append("SELECT " + (columns.map() { "\"" + $0 + "\""}).joined(separator: " , "), params: [])
    }
    
    public func select(_ columns: String...) -> SQLStmt {
        return select(columnArr: columns)
    }
    
    public func select(_ expr: SQLStmt) -> SQLStmt {
        return append("SELECT").append(expr)
    }
    
    public func orderBy(orderArr orders: [(String, Order)]) -> SQLStmt {
        var orderBy = append("ORDER BY")
        for (index, (column, order)) in orders.enumerated() {
            if index > 0 {
                orderBy = orderBy.append(",")
            }
            orderBy = orderBy.append("? " + order.rawValue, params: [column])
        }
        return orderBy
    }
    
    public func orderBy(orderArr orders: [(SQLStmt, Order)]) -> SQLStmt {
        var orderBy = append("ORDER BY")
        for (index, (column, order)) in orders.enumerated() {
            if index > 0 {
                orderBy = orderBy.append(",")
            }
            orderBy = orderBy.append(column).append(order.rawValue)
        }
        return orderBy
    }
    
    public func orderBy(_ orders: (String, Order)...) -> SQLStmt {
        return orderBy(orderArr: orders)
    }
    
    public func orderBy(_ orders: (SQLStmt, Order)...) -> SQLStmt {
        return orderBy(orderArr: orders)
    }
    
    public func offset(_ offset: UInt32) -> SQLStmt {
        return append("OFFSET").value(NSNumber(value: offset as UInt32))
    }
    
    public func limit(_ limit: UInt32) -> SQLStmt {
        return append("LIMIT").value(NSNumber(value: limit as UInt32))
    }
}

public extension SQLStmt {
    
    public func insert() -> SQLStmt {
        return append("INSERT INTO")
    }
    
    public func replace() -> SQLStmt {
        return append("REPLACE INTO")
    }
    
    public func values(_ values: [[FMDBConvertable]]) -> SQLStmt {
        var stmts = [SQLStmt]()
        stmts.append(SQLStmt("VALUES"))
        for (index, oneRow) in values.enumerated() {
            if index > 0 {
                stmts.append(SQLStmt(","))
            }
            
            let sqls: [SQLStmt] = ((oneRow.enumerated().map { (index, val) -> [SQLStmt] in
                if index + 1 == oneRow.count {
                    return [VALUE(val)]
                }
                return [VALUE(val),SQLStmt(",")]
            }).flatMap { $0 })
            stmts.append(ENCLOSED(sqls))
        }
        return append(stmts)
    }
}

public extension SQLStmt {
    
    public func delete() -> SQLStmt {
        let ret = append("DELETE")
        return ret
    }
    
    public func from(_ expr: String) -> SQLStmt {
        return append("FROM").id(expr)
    }
    
}

