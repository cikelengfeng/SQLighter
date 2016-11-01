import Foundation

public extension SQLStmt {
    
    public func insert() -> SQLStmt {
        return append("INSERT INTO")
    }
    
    public func replace() -> SQLStmt {
        return append("REPLACE INTO")
    }
    
    public func values(_ values: [[AnyObject]]) -> SQLStmt {
        var stmts = [SQLStmt]()
        stmts.append(SQLStmt("VALUES"))
        for (index, oneRow) in values.enumerated() {
            if index > 0 {
                stmts.append(SQLStmt(","))
            }
            
            let sqls: [SQLStmt] = ((oneRow.enumerated().map { (index, val) -> [SQLStmt] in
                if index + 1 == oneRow.count {
                    return [VALUE(val)]
                }
                return [VALUE(val),SQLStmt(",")]
                }).flatMap { $0 })
            stmts.append(ENCLOSED(sqls))
        }
        return append(stmts)
    }
}
