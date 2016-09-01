import Foundation

public class SQLKeyword: SQLStmt {
    private let keyword: String
    
    public init(_ keyword: String) {
        self.keyword = keyword
    }
    
    public override func string() -> String {
        return self.keyword
    }
    
    public override func parameters() -> [AnyObject] {
        return []
    }
}
