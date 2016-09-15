//
//  Identifier.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

public let OR = OR_()
public let AND = AND_()

public func ID(id: String) -> SQLStmt {
    return SQLStmt("?", params: [id])
}

public func VALUE(v: AnyObject) -> SQLStmt {
    return SQLStmt("?", params: [v])
}


public func ENCLOSED(expressions: [SQLStmt]) -> SQLStmt {
    let enclosed = SQLStmt()
    enclosed.append("(")
    for expr in expressions {
        enclosed.append(expr)
    }
    return enclosed.append(")")
}

public func ENCLOSED(expressions: SQLStmt...) -> SQLStmt {
    return ENCLOSED(expressions)
}

public func ENCLOSED(sql: String, params: [AnyObject]) -> SQLStmt {
    return ENCLOSED(SQLStmt(sql, params: params))
}

public func ENCLOSED(sql: String) -> SQLStmt {
    return ENCLOSED(sql, params: [])
}

public func AND_() -> SQLStmt {
    let pureSQL = SQLStmt("AND")
    return pureSQL
}

public func AND_(rhs: SQLStmt, lhs: SQLStmt) -> SQLStmt {
    let and = SQLStmt()
    return and.append(rhs).append(AND).append(lhs)
}

public func OR_() -> SQLStmt {
    let pureSQL = SQLStmt("OR")
    return pureSQL
}

public func OR_(rhs: SQLStmt, lhs: SQLStmt) -> SQLStmt {
    let or = SQLStmt()
    return or.append(rhs).append(OR).append(lhs)
}

public func UNION(rhs: SQLStmt, lhs: SQLStmt) -> SQLStmt {
    let union = SQLStmt()
    union.append(ENCLOSED([rhs]))
    union.append("UNION")
    union.append(ENCLOSED([lhs]))
    return union
}
