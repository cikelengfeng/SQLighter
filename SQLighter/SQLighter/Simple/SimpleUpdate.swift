import Foundation

public extension SQLStmt {
    
    public func update() -> SQLStmt {
        return append("UPDATE")
    }
    
    public func table(name: String) -> SQLStmt {
        return append(ID(name))
    }
    
    public func columns(columns: [String]) -> SQLStmt {
        let sqls: [SQLStmt] = ((columns.enumerate().map { (index, val) -> [SQLStmt] in
            if index + 1 == columns.count {
                return [ID(val)]
            }
            return [ID(val),SQLStmt(",")]
            }).flatMap { $0 })
        return append(ENCLOSED(sqls))
    }
    
    public func set(dict: [String: AnyObject]) -> SQLStmt {
        let sql = (dict.map { (column, value) -> String in
            return "? = ?"
            }).joinWithSeparator(" , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return [column, value]
        })).flatMap { $0 }
        return append("SET").append(sql, params: params)
    }
    
    public func set(dict: (SQLStmt, AnyObject)...) -> SQLStmt {
        let sql = (dict.map { (column, value) -> String in
            return "\(column.assemble()) = ?"
            }).joinWithSeparator(" , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return column.parameters() + [value]
        })).flatMap { $0 }
        return append("SET").append(sql, params: params)
    }
    
}