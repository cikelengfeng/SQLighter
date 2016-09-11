//
//  Identifier.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

func ID(id: String) -> SQLStmt {
    return SQLStmt("?", params: [id])
}

func Value(v: AnyObject) -> SQLStmt {
    return SQLStmt("?", params: [v])
}