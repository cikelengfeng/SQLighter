import Foundation

public class SQLIdentifier: SQLStmt {
    private let identifier: String
    
    public init(_ identifier: String) {
        self.identifier = identifier
    }
    
    public override func string() -> String {
        return "?"
    }
    
    public override func parameters() -> [AnyObject] {
        return [self.identifier]
    }
}
