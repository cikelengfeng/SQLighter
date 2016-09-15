import Foundation

public class SimpleDelete: SQLStmt {
    
    public func delete() -> Self {
        return append("DELETE")
    }
    
    public func from(expr: String) -> Self {
        return append("FROM").id(expr)
    }
    
}