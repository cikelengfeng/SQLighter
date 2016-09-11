import Foundation


//infix operator || { associativity left precedence 252 }
////func || (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
////    let sql = PureSQL("|| ?", params: [rhs])
////    return lhs.append(sql)
////}
//
//func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
//    let sql = PureSQL("||", params: [])
//    lhs.append(sql)
//    return lhs.append(rhs)
//}
//
//infix operator == { associativity left precedence 247 }
//func == (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
//    let sql = PureSQL("== ?", params: [rhs])
//    return lhs.append(sql)
//}
//
//infix operator != { associativity left precedence 247 }
//func != (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
//    let sql = PureSQL("!= ?", params: [rhs])
//    return lhs.append(sql)
//}
