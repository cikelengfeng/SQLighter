import Foundation

public class SelectOrValues: SQLRule {
    public func select() -> Self {
        let keyword = SQLKeyword("SELECT")
        self.append(keyword)
        return self
    }
    
    public func all() -> Self {
        let keyword = SQLKeyword("ALL")
        self.append(keyword)
        return self
    }
    
    public func distinct() -> Self {
        let keyword = SQLKeyword("DISTINCT")
        self.append(keyword)
        return self
    }
    
    public func allColumn() -> ResultColumn {
        let resultColumn = ResultColumn()
        let keyword = SQLKeyword("*")
        
        self.append(resultColumn)
        return resultColumn.append(keyword)
    }
    
    public func table(name: String) -> ResultColumn {
        let resultColumn = ResultColumn()
        let tableName = TableName()
        let anyName = SQLIdentifier(name)
        
        tableName.append(anyName)
        self.append(resultColumn)
        return resultColumn.append(tableName)
    }
    
}