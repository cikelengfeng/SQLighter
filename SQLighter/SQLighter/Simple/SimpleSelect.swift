import Foundation

public enum Order: String {
    case DESC = "DESC"
    case ASC = "ASC"
    case COLLATE_NOCASE = "COLLATE NOCASE"
}

public extension SQLStmt {

    public func select(columnArr columns: [String]) -> SQLStmt {
        return append("SELECT " + (columns.map() { "\"" + $0 + "\""}).joined(separator: " , "), params: [])
    }
    
    public func select(_ columns: String...) -> SQLStmt {
        return select(columnArr: columns)
    }
    
    public func select(_ expr: SQLStmt) -> SQLStmt {
        return append("SELECT").append(expr)
    }
    
    public func orderBy(orderArr orders: [(String, Order)]) -> SQLStmt {
        var orderBy = append("ORDER BY")
        for (index, (column, order)) in orders.enumerated() {
            if index > 0 {
                orderBy = orderBy.append(",")
            }
            orderBy = orderBy.append("? " + order.rawValue, params: [column as AnyObject])
        }
        return orderBy
    }
    
    public func orderBy(orderArr orders: [(SQLStmt, Order)]) -> SQLStmt {
        var orderBy = append("ORDER BY")
        for (index, (column, order)) in orders.enumerated() {
            if index > 0 {
                orderBy = orderBy.append(",")
            }
            orderBy = orderBy.append(column).append(order.rawValue)
        }
        return orderBy
    }
    
    public func orderBy(_ orders: (String, Order)...) -> SQLStmt {
        return orderBy(orderArr: orders)
    }
    
    public func orderBy(_ orders: (SQLStmt, Order)...) -> SQLStmt {
        return orderBy(orderArr: orders)
    }
    
    public func offset(_ offset: UInt32) -> SQLStmt {
        return append("OFFSET").value(NSNumber(value: offset as UInt32))
    }
    
    public func limit(_ limit: UInt32) -> SQLStmt {
        return append("LIMIT").value(NSNumber(value: limit as UInt32))
    }
}
