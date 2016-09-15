import Foundation

public class SimpleDelete: SQLStmt {
    
    public func delete() -> Self {
        return append("DELETE", params: [])
    }
    
    public func from(expr: String) -> Self {
        return append("FROM ?", params: [expr])
    }
    
}