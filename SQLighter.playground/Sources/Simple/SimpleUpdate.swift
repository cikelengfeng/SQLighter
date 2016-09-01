import Foundation

public class SimpleUpdate: SQLStmt {
    public func update() -> Self {
        let keyword = PureSQL("UPDATE", params: [])
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
    
    public func set(dict: [String: AnyObject]) -> Self {
        let keyword = PureSQL("SET", params: [])
        self.append(keyword)
        let sql = (dict.map { (column, value) -> String in
            return "? = ?"
            }).joinWithSeparator(" , ")
        let params = (dict.map({ (column, value) -> [AnyObject] in
            return [column, value]
        })).flatMap { $0 }
        let pureSQL = PureSQL(sql, params: params)
        return self.append(pureSQL)
    }
    
}