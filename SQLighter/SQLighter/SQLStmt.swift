import Foundation

public struct SQLStmt: ArrayLiteralConvertible {
    
    private let baseSQL: String
    private let baseParams: [AnyObject]
    
    public init(_ sql: String, params: [AnyObject]) {
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
        return self.baseParams
    }
    
    public func append(child: SQLStmt) -> SQLStmt {
        var sql = ""
        if self.baseSQL.characters.count * child.baseSQL.characters.count == 0 {
            sql = self.baseSQL + child.baseSQL
        }else {
            sql = self.baseSQL + " " + child.baseSQL
        }
        return SQLStmt(sql, params: self.baseParams + child.baseParams)
    }
    
    public func append(sqls: [SQLStmt]) -> SQLStmt {
        var ret = SQLStmt(self.baseSQL, params: self.baseParams)
        for sql in sqls {
            ret = ret.append(sql)
        }
        return ret
    }
    
    public func append(pureSQL: String) -> SQLStmt {
        let pureSQL = SQLStmt(pureSQL, params: [])
        return append(pureSQL)
    }
    
    public func append(pureSQL: String, params: [AnyObject]) -> SQLStmt {
        let pureSQL = SQLStmt(pureSQL, params: params)
        return append(pureSQL)
    }
    
    private func estimateRetainCycleAfterAppend(sql: SQLStmt) -> Bool {
        //TODO: impl
        return false
    }
}

public extension SQLStmt {
    
    public func where_(expressions: SQLStmt...) -> SQLStmt {
        return append("WHERE").append(AND_JOINED(expressions))
    }
    
    public func not() -> SQLStmt {
        return append("NOT")
    }
    
    public func in_(paramArr params: [AnyObject]) -> SQLStmt {
        return append("IN").append(ENCLOSED(SQLStmt((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)))
    }
    
    public func in_(params: AnyObject...) -> SQLStmt {
        return in_(paramArr: params)
    }
    
    public func in_(expr: SQLStmt) -> SQLStmt {
        return append("IN").append(ENCLOSED(expr))
    }
    
    public func like() -> SQLStmt {
        return append("LIKE")
    }
    
    public func like(value: AnyObject) -> SQLStmt {
        return like().value(value)
    }
    
    public func like(expr: SQLStmt) -> SQLStmt {
        return like().append(expr)
    }
    
    public func glob() -> SQLStmt {
        return append("GLOB")
    }
    
    public func glob(value: AnyObject) -> SQLStmt {
        return glob().value(value)
    }
    
    public func glob(expr: SQLStmt) -> SQLStmt {
        return glob().append(expr)
    }
    
    public func match() -> SQLStmt {
        return append("MATCH")
    }
    
    public func match(value: AnyObject) -> SQLStmt {
        return match().value(value)
    }
    
    public func match(expr: SQLStmt) -> SQLStmt {
        return match().append(expr)
    }
    
    public func regex() -> SQLStmt {
        return append("REGEXP")
    }
    
    public func regex(value: AnyObject) -> SQLStmt {
        return regex().value(value)
    }
    
    public func regex(expr: SQLStmt) -> SQLStmt {
        return regex().append(expr)
    }
    
    public func id(id: String) -> SQLStmt {
        return append("\"\(id)\"", params: [])
    }
    
    public func value(v: AnyObject) -> SQLStmt {
        return append("?", params: [v])
    }
}

