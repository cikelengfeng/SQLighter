import Foundation

public extension SQLStmt {
    
    public func update() -> SQLStmt {
        return append("UPDATE")
    }
    
    public func table(name: String) -> SQLStmt {
        return append("?", params: [name])
    }
    
    public func columns(columns: [String]) -> SQLStmt {
        return append(ENCLOSED((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns))
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
    
}