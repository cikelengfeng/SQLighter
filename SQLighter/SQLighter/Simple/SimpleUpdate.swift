import Foundation

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
    
    public func set(_ dict: [String: AnyObject]) -> SQLStmt {
        let sql = (dict.keys.map { column in
            return "\"\(column)\" = ?"
            }).joined(separator: " , ")
        let params = Array(dict.values)
        return append("SET").append(sql, params: params)
    }
    
    public func set(_ dict: (SQLStmt, AnyObject)...) -> SQLStmt {
        let sql = (dict.map { (column, value) -> String in
            return "\(column.assemble()) = ?"
            }).joined(separator: " , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return column.parameters() + [value]
        })).flatMap { $0 }
        return append("SET").append(sql, params: params)
    }
    
}
