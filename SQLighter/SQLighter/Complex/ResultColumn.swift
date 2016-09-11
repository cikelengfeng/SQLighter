import Foundation

public class ResultColumn: SQLRule {
    public func allColumn() -> Self {
        let keyword = SQLKeyword(".*")
        return self.append(keyword)
    }
}