import Foundation

public enum Order: String {
    case DESC
    case ASC
}

public class SimpleSelect: SQLStmt {

    public func select(expr: String) -> Self {
        return self.append("SELECT " + expr, params: [])
    }
    
    public func select(columnArr columns: [String]) -> Self {
        return self.append("SELECT " + (columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
    }
    
    public func select(columns: String...) -> Self {
        return select(columnArr: columns)
    }
    
    public func from(expr: String) -> Self {
        let pureSQL = SQLStmt("FROM ?", params: [expr])
        return self.append(pureSQL)
    }
    
    public func orderBy(orders: [(String, Order)]) -> Self {
        let keyword = SQLStmt("ORDER BY", params: [])
        self.append(keyword)
        for (index, (column, order)) in orders.enumerate() {
            if index > 0 {
                let comma = SQLStmt(",", params: [])
                self.append(comma)
            }
            let order = SQLStmt("? " + order.rawValue, params: [column])
            self.append(order)
        }
        return self
    }
    
    public func offset(offset: UInt32) -> Self {
        let pureSQL = SQLStmt("OFFSET ?", params: [NSNumber(unsignedInt: offset)])
        return self.append(pureSQL)
    }
    
    public func limit(limit: UInt32) -> Self {
        let pureSQL = SQLStmt("LIMIT ?", params: [NSNumber(unsignedInt: limit)])
        return self.append(pureSQL)
    }
}