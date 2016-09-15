import Foundation

public enum Order: String {
    case DESC
    case ASC
}

public class SimpleSelect: SQLStmt {

    public func select(expr: String) -> Self {
        return append("SELECT " + expr, params: [])
    }
    
    public func select(columnArr columns: [String]) -> Self {
        return append("SELECT " + (columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
    }
    
    public func select(columns: String...) -> Self {
        return select(columnArr: columns)
    }
    
    public func from(expr: String) -> Self {
        return append("FROM ?", params: [expr])
    }
    
    public func orderBy(orders: [(String, Order)]) -> Self {
        append("ORDER BY", params: [])
        for (index, (column, order)) in orders.enumerate() {
            if index > 0 {
                append(",", params: [])
            }
            append("? " + order.rawValue, params: [column])
        }
        return self
    }
    
    public func offset(offset: UInt32) -> Self {
        return append("OFFSET ?", params: [NSNumber(unsignedInt: offset)])
    }
    
    public func limit(limit: UInt32) -> Self {
        return append("LIMIT ?", params: [NSNumber(unsignedInt: limit)])
    }
}