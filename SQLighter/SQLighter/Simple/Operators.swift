import Foundation


infix operator || { associativity left precedence 252 }
func || (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").value(rhs)
}

func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").append(rhs)
}

infix operator * { associativity left precedence 251 }
func * (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").value(rhs)
}

func * (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").append(rhs)
}

infix operator / { associativity left precedence 251 }
func / (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").value(rhs)
}

func / (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").append(rhs)
}

infix operator % { associativity left precedence 251 }
func % (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").value(rhs)
}

func % (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").append(rhs)
}

infix operator + { associativity left precedence 250 }
func + (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").value(rhs)
}

func + (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").append(rhs)
}

infix operator - { associativity left precedence 250 }
func - (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").value(rhs)
}

func - (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").append(rhs)
}

infix operator << { associativity left precedence 249 }
func << (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").value(rhs)
}

func << (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").append(rhs)
}
infix operator >> { associativity left precedence 249 }
func >> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").value(rhs)
}

func >> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").append(rhs)
}
infix operator & { associativity left precedence 249 }
func & (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").value(rhs)
}

func & (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").append(rhs)
}
infix operator | { associativity left precedence 249 }
func | (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").value(rhs)
}

func | (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").append(rhs)
}

infix operator < { associativity left precedence 248 }
func < (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").value(rhs)
}

func < (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").append(rhs)
}

infix operator <= { associativity left precedence 248 }
func <= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").value(rhs)
}

func <= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").append(rhs)
}

infix operator > { associativity left precedence 248 }
func > (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").value(rhs)
}

func > (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").append(rhs)
}

infix operator >= { associativity left precedence 248 }
func >= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").value(rhs)
}

func >= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").append(rhs)
}

infix operator == { associativity left precedence 247 }
func == (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").value(rhs)
}

func == (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").append(rhs)
}

infix operator <> { associativity left precedence 247 }
func <> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").value(rhs)
}

func <> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").append(rhs)
}

infix operator != { associativity left precedence 247 }
func != (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").value(rhs)
}

func != (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").append(rhs)
}

