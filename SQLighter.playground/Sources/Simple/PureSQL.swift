import Foundation

public class PureSQL: SQLStmt {
    private let sql: String
    private let params: [AnyObject]
    
    public init(_ sql: String, params: [AnyObject]) {
        self.sql = sql
        self.params = params
    }
    
    public override func string() -> String {
        return self.sql
    }
    
    public override func parameters() -> [AnyObject] {
        return self.params
    }
}