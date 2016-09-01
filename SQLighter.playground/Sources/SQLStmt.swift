import Foundation

public class SQLStmt {
    
    private var childrenStmt: [SQLStmt]
    internal weak var parentStmt: SQLStmt?
    internal weak var leftStmt: SQLStmt?
    
    public init() {
        self.childrenStmt = []
    }
    
    public func string() -> String {
        return (self.childrenStmt.map { $0.string() }).joinWithSeparator(" ")
    }
    
    public func parameters() -> [AnyObject] {
        return self.childrenStmt.reduce([], combine: { $0 + $1.parameters() })
    }
    
    public func append(child: SQLStmt) -> Self {
        child.parentStmt = self
        child.leftStmt = self.childrenStmt.last
        self.childrenStmt.append(child)
        return self
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
    public func pureSQL(expr: String, params: [AnyObject]) -> Self {
        let pureSQL = PureSQL(expr, params: params)
        return self.append(pureSQL)
    }
    
    public func identifier(id: String) -> Self {
        let pureSQL = PureSQL("?", params: [id])
        return self.append(pureSQL)
    }
    
    public func value(value: AnyObject) -> Self {
        let pureSQL = PureSQL("?", params: [value])
        return self.append(pureSQL)
    }
    
    public func inWhere() -> Self {
        let pureSQL = PureSQL("WHERE", params: [])
        return self.append(pureSQL)
    }
    
    public func expr(expr: String, params: [AnyObject]) -> Self {
        let pureSQL = PureSQL(expr, params: params)
        return self.append(pureSQL)
    }
    
    public func not() -> Self {
        let pureSQL = PureSQL("NOT", params: [])
        return self.append(pureSQL)
    }
    
    public func inSet(params: [AnyObject]) -> Self {
        let keyword = PureSQL("IN", params: [])
        self.append(keyword)
        let leftBracket = PureSQL("(", params: [])
        self.append(leftBracket)
        let pureSQL = PureSQL((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)
        self.append(pureSQL)
        let rightBracket = PureSQL(")", params: [])
        return self.append(rightBracket)
    }
    
    public func and() -> Self {
        let pureSQL = PureSQL("AND", params: [])
        return self.append(pureSQL)
    }
    
    public func or() -> Self {
        let pureSQL = PureSQL("OR", params: [])
        return self.append(pureSQL)
    }
    
    public func like() -> Self {
        let pureSQL = PureSQL("LIKE", params: [])
        return self.append(pureSQL)
    }
    
    public func glob() -> Self {
        let pureSQL = PureSQL("GLOB", params: [])
        return self.append(pureSQL)
    }
    
    public func match() -> Self {
        let pureSQL = PureSQL("MATCH", params: [])
        return self.append(pureSQL)
    }
    
    public func regex() -> Self {
        let pureSQL = PureSQL("REGEXP", params: [])
        return self.append(pureSQL)
    }
    
    public func enclosedExpr(expr: SQLStmt) -> Self {
        let leftBracket = PureSQL("(", params: [])
        self.append(leftBracket)
        self.append(expr)
        let rightBracket = PureSQL(")", params: [])
        return self.append(rightBracket)
    }
}


