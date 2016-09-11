import Foundation

public class SimpleInsert: SQLStmt {
    
    public init() {
        super.init("", params: [])
    }
    
    public func insert() -> Self {
        let keyword = SQLStmt("INSERT INTO", params: [])
        return self.append(keyword)
    }
    
    public func replace() -> Self {
        let keyword = SQLStmt("REPLACE INTO", params: [])
        return self.append(keyword)
    }
    
    public func table(name: String) -> Self {
        let sql = SQLStmt("?", params: [name])
        return self.append(sql)
    }
    
    public func columns(columns: [String]) -> Self {
        let leftBracket = SQLStmt("(", params: [])
        self.append(leftBracket)
        let sql = SQLStmt((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
        self.append(sql)
        let rightBracket = SQLStmt(")", params: [])
        return self.append(rightBracket)
    }
    
    public func values(values: [[AnyObject]]) -> Self {
        let keyword = SQLStmt("VALUES", params: [])
        self.append(keyword)
        for (index, oneRow) in values.enumerate() {
            if index > 0 {
                let comma = SQLStmt(",", params: [])
                self.append(comma)
            }
            
            let leftBracket = SQLStmt("(", params: [])
            self.append(leftBracket)
            let sql = SQLStmt((oneRow.map() {_ in "?"}).joinWithSeparator(" , "), params: oneRow)
            self.append(sql)
            let rightBracket = SQLStmt(")", params: [])
            self.append(rightBracket)
        }
        return self
    }
}