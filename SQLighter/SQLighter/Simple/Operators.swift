import Foundation


//infix operator || { associativity none }
func || (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").value(rhs)
}

func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").append(rhs)
}

//infix operator * { associativity none }
func * (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").value(rhs)
}

func * (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").append(rhs)
}

//infix operator / { associativity none }
func / (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").value(rhs)
}

func / (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").append(rhs)
}

//infix operator % { associativity none }
func % (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").value(rhs)
}

func % (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").append(rhs)
}

//infix operator + { associativity none }
func + (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").value(rhs)
}

func + (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").append(rhs)
}

//infix operator - { associativity none }
func - (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").value(rhs)
}

func - (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").append(rhs)
}

//infix operator << { associativity none }
func << (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").value(rhs)
}

func << (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").append(rhs)
}
//infix operator >> { associativity none }
func >> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").value(rhs)
}

func >> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").append(rhs)
}
//infix operator & { associativity none }
func & (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").value(rhs)
}

func & (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").append(rhs)
}
//infix operator | { associativity none }
func | (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").value(rhs)
}

func | (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").append(rhs)
}

//infix operator < { associativity none }
func < (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").value(rhs)
}

func < (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").append(rhs)
}

//infix operator <= { associativity none }
func <= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").value(rhs)
}

func <= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").append(rhs)
}

//infix operator > { associativity none }
func > (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").value(rhs)
}

func > (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").append(rhs)
}

//infix operator >= { associativity none }
func >= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").value(rhs)
}

func >= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").append(rhs)
}

//infix operator == { associativity none }
func == (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").value(rhs)
}

func == (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").append(rhs)
}

infix operator <> { associativity none}
func <> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").value(rhs)
}

func <> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").append(rhs)
}

//infix operator != { associativity none }
func != (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").value(rhs)
}

func != (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").append(rhs)
}

