import Foundation

public enum Order: String {
    case DESC
    case ASC
}

public class SimpleSelect: SQLStmt {

    public init() {
        super.init("", params: [])
    }
    
    public func select(expr: String) -> Self {
        let pureSQL = SQLStmt("SELECT " + expr, params: [])
        return self.append(pureSQL)
    }
    
    public func select(columns: [String]) -> Self {
        let keyword = SQLStmt("SELECT", params: [])
        self.append(keyword)
        let pureSQL = SQLStmt((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
        return self.append(pureSQL)
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