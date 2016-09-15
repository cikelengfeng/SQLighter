import Foundation

public class SimpleInsert: SQLStmt {
    
    public func insert() -> Self {
        return append("INSERT INTO")
    }
    
    public func replace() -> Self {
        return append("REPLACE INTO")
    }
    
    public func table(name: String) -> Self {
        return id(name)
    }
    
    public func columns(columns: [String]) -> Self {
        let sqls: [SQLStmt] = ((columns.map { col -> [SQLStmt] in
            if let last = columns.last where col == last {
                return [ID(col)]
            }
            return [ID(col),SQLStmt(",")]
        }).flatMap { $0 })
        return append(ENCLOSED(sqls))
    }
    
    public func values(values: [[AnyObject]]) -> Self {
        append("VALUES")
        for (index, oneRow) in values.enumerate() {
            if index > 0 {
                append(",")
            }
            
            let sqls: [SQLStmt] = ((oneRow.map { val -> [SQLStmt] in
                if let last = oneRow.last where last === val {
                    return [VALUE(val)]
                }
                return [VALUE(val),SQLStmt(",")]
                }).flatMap { $0 })
            append(ENCLOSED(sqls))
        }
        return self
    }
}