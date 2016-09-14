//
//  SQLStmtGroup.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/14.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

public protocol SQLStmtGroup {
    
    func statements() -> [SQLStmt]
}

public class SQLEnclosedStmt: SQLStmt, SQLStmtGroup, ArrayLiteralConvertible {

    init(arrayLiteral elements: Self.Element...) {
        self.append(enclosed(elements))
        super.init("", [])
    }

    
}

extension SQLStmt: SQLStmtGroup {
    public func statements() -> [SQLStmt] {
        return [self]
    }
}

