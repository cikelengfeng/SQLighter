import Foundation

public extension SQLStmt {
    
    public func delete() -> SQLStmt {
        let ret = append("DELETE")
        return ret
    }
    
    public func from(_ expr: String) -> SQLStmt {
        return append("FROM").id(expr)
    }
    
}
