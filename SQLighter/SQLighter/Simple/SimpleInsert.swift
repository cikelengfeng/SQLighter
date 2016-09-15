import Foundation

public class SimpleInsert: SQLStmt {
    
    public func insert() -> Self {
        return append("INSERT INTO", params: [])
    }
    
    public func replace() -> Self {
        return append("REPLACE INTO", params: [])
    }
    
    public func table(name: String) -> Self {
        return append("?", params: [name])
    }
    
    public func columns(columns: [String]) -> Self {
        append("(", params: [])
        append((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
        return append(")", params: [])
    }
    
    public func values(values: [[AnyObject]]) -> Self {
        append("VALUES", params: [])
        for (index, oneRow) in values.enumerate() {
            if index > 0 {
                append(",", params: [])
            }
            
            append("(", params: [])
            append((oneRow.map() {_ in "?"}).joinWithSeparator(" , "), params: oneRow)
            append(")", params: [])
        }
        return self
    }
}