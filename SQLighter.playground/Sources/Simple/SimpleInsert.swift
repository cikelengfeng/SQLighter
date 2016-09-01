import Foundation

public class SimpleInsert: SQLStmt {
    
    public func insert() -> Self {
        let keyword = PureSQL("INSERT INTO", params: [])
        return self.append(keyword)
    }
    
    public func replace() -> Self {
        let keyword = PureSQL("REPLACE INTO", params: [])
        return self.append(keyword)
    }
    
    public func table(name: String) -> Self {
        let sql = PureSQL("?", params: [name])
        return self.append(sql)
    }
    
    public func columns(columns: [String]) -> Self {
        let leftBracket = PureSQL("(", params: [])
        self.append(leftBracket)
        let sql = PureSQL((columns.map() {_ in "?"}).joinWithSeparator(" , "), params: columns)
        self.append(sql)
        let rightBracket = PureSQL(")", params: [])
        return self.append(rightBracket)
    }
    
    public func values(values: [[AnyObject]]) -> Self {
        let keyword = PureSQL("VALUES", params: [])
        self.append(keyword)
        for (index, oneRow) in values.enumerate() {
            if index > 0 {
                let comma = PureSQL(",", params: [])
                self.append(comma)
            }
            
            let leftBracket = PureSQL("(", params: [])
            self.append(leftBracket)
            let sql = PureSQL((oneRow.map() {_ in "?"}).joinWithSeparator(" , "), params: oneRow)
            self.append(sql)
            let rightBracket = PureSQL(")", params: [])
            self.append(rightBracket)
        }
        return self
    }
}