import Foundation

public class SQLIdentifierOrValue: SQLStmt {
    private let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public override func string() -> String {
        return "?"
    }
    
    public override func parameters() -> [AnyObject] {
        return [self.value]
    }
}
