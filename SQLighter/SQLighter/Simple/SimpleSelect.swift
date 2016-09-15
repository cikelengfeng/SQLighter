import Foundation

public enum Order: String {
    case DESC
    case ASC
}

public class SimpleSelect: SQLStmt {

    public func select(sql: String) -> Self {
        return append("SELECT " + sql, params: [])
    }
    
    public func select(columnArr columns: [String]) -> Self {
        return append("SELECT " + (columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
    }
    
    public func select(columns: String...) -> Self {
        return select(columnArr: columns)
    }
    
    public func select(expr: SQLStmt) -> Self {
        return append("SELECT").append(expr)
    }
    
    public func from(expr: String) -> Self {
        return append("FROM ?", params: [expr])
    }
    
    public func orderBy(orders: [(String, Order)]) -> Self {
        append("ORDER BY")
        for (index, (column, order)) in orders.enumerate() {
            if index > 0 {
                append(",")
            }
            append("? " + order.rawValue, params: [column])
        }
        return self
    }
    
    public func offset(offset: UInt32) -> Self {
        return append("OFFSET").value(NSNumber(unsignedInt: offset))
    }
    
    public func limit(limit: UInt32) -> Self {
        return append("LIMIT").value(NSNumber(unsignedInt: limit))
    }
}