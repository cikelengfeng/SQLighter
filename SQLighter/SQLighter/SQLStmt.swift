import Foundation

public class SQLStmt: ArrayLiteralConvertible {
    
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
    
    public convenience init() {
        self.init("", params: [])
    }
    
    required public convenience init(arrayLiteral elements: SQLStmt...) {
        self.init()
        if elements.count == 0 {
            return
        }
        if elements.count == 1 {
            append(elements[0])
            return
        }
        append("(")
        for (index, expr) in elements.enumerate() {
            if index != 0  && (!elements[index - 1].assemble().hasSuffix("OR"))  && (!expr.assemble().hasSuffix("OR")) {
                append(and())
            }
            append(expr)
        }
        append(")")
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
    
    public func where_(expressions: SQLStmt...) -> Self {
        append("WHERE", params: [])
        for (index, expr) in expressions.enumerate() {
            if index != 0  && (!expressions[index - 1].assemble().hasSuffix("OR"))  && (!expr.assemble().hasSuffix("OR")) {
                append(and())
            }
            append(expr)
            
        }
        return self
    }
    
    public func not() -> Self {
        return append("NOT", params: [])
    }
    
    public func in_(paramArr params: [AnyObject]) -> Self {
        append("IN", params: [])
        return append(enclosed(SQLStmt((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)))
    }
    
    public func in_(params: AnyObject...) -> Self {
        return in_(paramArr: params)
    }
    
    public func like() -> Self {
        return append("LIKE", params: [])
    }
    
    public func like(value: AnyObject) -> Self {
        return like().value(value)
    }
    
    public func like(expr: SQLStmt) -> Self {
        return like().append(expr)
    }
    
    public func glob() -> Self {
        return append("GLOB", params: [])
    }
    
    public func glob(value: AnyObject) -> Self {
        return glob().value(value)
    }
    
    public func glob(expr: SQLStmt) -> Self {
        return glob().append(expr)
    }
    
    public func match() -> Self {
        return append("MATCH", params: [])
    }
    
    public func match(value: AnyObject) -> Self {
        return match().value(value)
    }
    
    public func match(expr: SQLStmt) -> Self {
        return match().append(expr)
    }
    
    public func regex() -> Self {
        return append("REGEXP", params: [])
    }
    
    public func regex(value: AnyObject) -> Self {
        return regex().value(value)
    }
    
    public func regex(expr: SQLStmt) -> Self {
        return regex().append(expr)
    }
    
    public func id(id: String) -> Self {
        return append("?", params: [id])
    }
    
    public func value(v: AnyObject) -> Self {
        return append("?", params: [v])
    }
}

