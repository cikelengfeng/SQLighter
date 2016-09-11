import Foundation

public class SQLStmt {
    
    private var childrenStmt: [SQLStmt]
    internal weak var parentStmt: SQLStmt?
    internal weak var leftStmt: SQLStmt?
    
    private let baseSQL: String
    private let baseParams: [AnyObject]
    
    public init(_ sql: String, params: [AnyObject]) {
        self.baseSQL = sql
        self.baseParams = params
        self.childrenStmt = []
    }
    
    public func assemble() -> String {
        if self.childrenStmt.count == 0 {
            return self.baseSQL
        }
        let prefix = self.baseSQL.characters.count == 0 ? "" : self.baseSQL + " "
        let ret = prefix + ((self.childrenStmt.map { $0.assemble() }).joinWithSeparator(" "))
        return ret
    }
    
    public func parameters() -> [AnyObject] {
        return self.baseParams + self.childrenStmt.reduce([], combine: { $0 + $1.parameters() })
    }
    
    public func append(child: SQLStmt) -> Self {
        child.parentStmt = self
        child.leftStmt = self.childrenStmt.last
        self.childrenStmt.append(child)
        return self
    }
    
    public func append(pureSQL: String) -> Self {
        let pureSQL = SQLStmt(pureSQL, params: [])
        return self.append(pureSQL)
    }
    
    public func append(pureSQL: String, params: [AnyObject]) -> Self {
        let pureSQL = SQLStmt(pureSQL, params: params)
        return self.append(pureSQL)
    }
    
    internal func children() -> [SQLStmt] {
        return self.childrenStmt
    }
    
    public func parent() -> SQLStmt? {
        return self.parentStmt
    }
    
    public func left() -> SQLStmt? {
        return self.leftStmt
    }
}

public extension SQLStmt {
    
    func copy() -> SQLStmt {
        let copy = SQLStmt(self.baseSQL, params: self.baseParams)
        copy.childrenStmt = self.childrenStmt
        copy.parentStmt = self.parentStmt
        copy.leftStmt = self.leftStmt
        return copy
    }
}

public extension SQLStmt {
    public func sql(expr: String, params: [AnyObject]) -> Self {
        let pureSQL = SQLStmt(expr, params: params)
        return self.append(pureSQL)
    }
    
    public func identifier(id: String) -> Self {
        let pureSQL = SQLStmt("?", params: [id])
        return self.append(pureSQL)
    }
    
    public func value(value: AnyObject) -> Self {
        let pureSQL = SQLStmt("?", params: [value])
        return self.append(pureSQL)
    }
    
    public func wherec() -> Self {
        let pureSQL = SQLStmt("WHERE", params: [])
        return self.append(pureSQL)
    }
    
    public func op(op: String) -> Self {
        let pureSQL = SQLStmt(op, params: [])
        return self.append(pureSQL)
    }
    
    public func not() -> Self {
        let pureSQL = SQLStmt("NOT", params: [])
        return self.append(pureSQL)
    }
    
    public func inSet(params: [AnyObject]) -> Self {
        let keyword = SQLStmt("IN", params: [])
        self.append(keyword)
        let leftBracket = SQLStmt("(", params: [])
        self.append(leftBracket)
        let pureSQL = SQLStmt((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)
        self.append(pureSQL)
        let rightBracket = SQLStmt(")", params: [])
        return self.append(rightBracket)
    }
    
    public func and() -> Self {
        let pureSQL = SQLStmt("AND", params: [])
        return self.append(pureSQL)
    }
    
    public func or() -> Self {
        let pureSQL = SQLStmt("OR", params: [])
        return self.append(pureSQL)
    }
    
    public func like() -> Self {
        let pureSQL = SQLStmt("LIKE", params: [])
        return self.append(pureSQL)
    }
    
    public func glob() -> Self {
        let pureSQL = SQLStmt("GLOB", params: [])
        return self.append(pureSQL)
    }
    
    public func match() -> Self {
        let pureSQL = SQLStmt("MATCH", params: [])
        return self.append(pureSQL)
    }
    
    public func regex() -> Self {
        let pureSQL = SQLStmt("REGEXP", params: [])
        return self.append(pureSQL)
    }
    
    public func enclosedExpr(expr: SQLStmt) -> Self {
        let leftBracket = SQLStmt("(", params: [])
        self.append(leftBracket)
        self.append(expr)
        let rightBracket = SQLStmt(")", params: [])
        return self.append(rightBracket)
    }
}


