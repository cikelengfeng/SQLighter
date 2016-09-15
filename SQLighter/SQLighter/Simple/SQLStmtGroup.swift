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
