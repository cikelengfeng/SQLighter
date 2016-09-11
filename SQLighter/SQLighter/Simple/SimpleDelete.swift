import Foundation

public class SimpleDelete: SQLStmt {
    
    public init() {
        super.init("", params: [])
    }
    
    public func delete(table: String) -> Self {
        let keyword = SQLStmt("DELETE FROM ?", params: [table])
        return self.append(keyword)
    }
    
}