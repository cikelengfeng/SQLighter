import Foundation

public enum Order: String {
    case DESC = "DESC"
    case ASC = "ASC"
    case COLLATE_NOCASE = "COLLATE NOCASE"
}

public extension SQLStmt {

    public func select(columnArr columns: [String]) -> SQLStmt {
        return append("SELECT " + (columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
    }
    
    public func select(columns: String...) -> SQLStmt {
        return select(columnArr: columns)
    }
    
    public func select(expr: SQLStmt) -> SQLStmt {
        return append("SELECT").append(expr)
    }
    
    public func orderBy(orderArr orders: [(String, Order)]) -> SQLStmt {
        var orderBy = append("ORDER BY")
        for (index, (column, order)) in orders.enumerate() {
            if index > 0 {
                orderBy = orderBy.append(",")
            }
            orderBy = orderBy.append("? " + order.rawValue, params: [column])
        }
        return orderBy
    }
    
    public func orderBy(orders: (String, Order)...) -> SQLStmt {
        return orderBy(orderArr: orders)
    }
    
    public func offset(offset: UInt32) -> SQLStmt {
        return append("OFFSET").value(NSNumber(unsignedInt: offset))
    }
    
    public func limit(limit: UInt32) -> SQLStmt {
        return append("LIMIT").value(NSNumber(unsignedInt: limit))
    }
}