import Foundation

public class SimpleDelete: SQLStmt {
    
    public func deleteFrom(table: String) -> Self {
        let keyword = PureSQL("DELETE FROM ?", params: [table])
        return self.append(keyword)
    }
    
}