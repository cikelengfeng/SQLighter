import Foundation

public class SimpleUpdate: SQLStmt {
    
    public func update() -> Self {
        return append("UPDATE")
    }
    
    public func table(name: String) -> Self {
        return append("?", params: [name])
    }
    
    public func columns(columns: [String]) -> Self {
        return append(ENCLOSED((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns))
    }
    
    public func set(dict: [String: AnyObject]) -> Self {
        append("SET")
        let sql = (dict.map { (column, value) -> String in
            return "? = ?"
            }).joinWithSeparator(" , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return [column, value]
        })).flatMap { $0 }
        return append(sql, params: params)
    }
    
}