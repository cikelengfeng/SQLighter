import Foundation

public enum Order: String {
    case DESC
    case ASC
}

public class SimpleSelect: SQLStmt {
    public func select(expr: String) -> Self {
        let pureSQL = PureSQL("SELECT " + expr, params: [])
        return self.append(pureSQL)
    }
    
    public func select(columns: [String]) -> Self {
        let keyword = PureSQL("SELECT", params: [])
        self.append(keyword)
        let pureSQL = PureSQL((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
        return self.append(pureSQL)
    }
    
    public func from(expr: String) -> Self {
        let pureSQL = PureSQL("FROM ?", params: [expr])
        return self.append(pureSQL)
    }
    
    public func orderBy(orders: [(String, Order)]) -> Self {
        let keyword = PureSQL("ORDER BY", params: [])
        self.append(keyword)
        for (index, (column, order)) in orders.enumerate() {
            if index > 0 {
                let comma = PureSQL(",", params: [])
                self.append(comma)
            }
            let order = PureSQL("? " + order.rawValue, params: [column])
            self.append(order)
        }
        return self
    }
    
    public func offset(offset: UInt32) -> Self {
        let pureSQL = PureSQL("OFFSET ?", params: [NSNumber(unsignedInt: offset)])
        return self.append(pureSQL)
    }
    
    public func limit(limit: UInt32) -> Self {
        let pureSQL = PureSQL("LIMIT ?", params: [NSNumber(unsignedInt: limit)])
        return self.append(pureSQL)
    }
}