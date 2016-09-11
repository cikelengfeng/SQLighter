import Foundation

public class SimpleUpdate: SQLStmt {
    
    public init() {
        super.init("", params: [])
    }
    
    public func update() -> Self {
        let keyword = SQLStmt("UPDATE", params: [])
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
    
    public func set(dict: [String: AnyObject]) -> Self {
        let keyword = SQLStmt("SET", params: [])
        self.append(keyword)
        let sql = (dict.map { (column, value) -> String in
            return "? = ?"
            }).joinWithSeparator(" , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return [column, value]
        })).flatMap { $0 }
        let pureSQL = SQLStmt(sql, params: params)
        return self.append(pureSQL)
    }
    
}