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
    
    public convenience init(_ sql: String) {
        self.init(sql, params: [])
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
        append(ENCLOSED(andJoined(elements)))
    }
    
    private func andJoined(sqls: [SQLStmt]) -> [SQLStmt] {
        var ret = [SQLStmt]()
        for (index, sql) in sqls.enumerate() {
            if index != 0  && (!sqls[index - 1].assemble().hasSuffix("OR"))  && (!sql.assemble().hasSuffix("OR")) {
                ret.append(AND)
            }
            ret.append(sql)
        }
        return ret
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
        assert((self as SQLStmt) !== child, "MUST NOT append self")
        child.parentStmt = self
        child.leftStmt = self.childrenStmt.last
        self.childrenStmt.append(child)
        return self
    }
    
    public func append(sqls: [SQLStmt]) -> Self {
        sqls.forEach { sql in
            append(sql)
        }
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
        return append("WHERE").append(andJoined(expressions))
    }
    
    public func not() -> Self {
        return append("NOT")
    }
    
    public func in_(paramArr params: [AnyObject]) -> Self {
        return append("IN").append(ENCLOSED(SQLStmt((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)))
    }
    
    public func in_(params: AnyObject...) -> Self {
        return in_(paramArr: params)
    }
    
    public func like() -> Self {
        return append("LIKE")
    }
    
    public func like(value: AnyObject) -> Self {
        return like().value(value)
    }
    
    public func like(expr: SQLStmt) -> Self {
        return like().append(expr)
    }
    
    public func glob() -> Self {
        return append("GLOB")
    }
    
    public func glob(value: AnyObject) -> Self {
        return glob().value(value)
    }
    
    public func glob(expr: SQLStmt) -> Self {
        return glob().append(expr)
    }
    
    public func match() -> Self {
        return append("MATCH")
    }
    
    public func match(value: AnyObject) -> Self {
        return match().value(value)
    }
    
    public func match(expr: SQLStmt) -> Self {
        return match().append(expr)
    }
    
    public func regex() -> Self {
        return append("REGEXP")
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

