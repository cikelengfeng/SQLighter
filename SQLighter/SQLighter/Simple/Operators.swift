import Foundation


infix operator || { associativity left precedence 252 }
func || (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("|| ?", params: [rhs])
}

func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("||")
    return ret.append(rhs)
}

infix operator * { associativity left precedence 251 }
func * (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("* ?", params: [rhs])
}

func * (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("*")
    return ret.append(rhs)
}

infix operator / { associativity left precedence 251 }
func / (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("/ ?", params: [rhs])
}

func / (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("/")
    return ret.append(rhs)
}

infix operator % { associativity left precedence 251 }
func % (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("% ?", params: [rhs])
}

func % (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("%")
    return ret.append(rhs)
}

infix operator + { associativity left precedence 250 }
func + (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("+ ?", params: [rhs])
}

func + (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("+")
    return ret.append(rhs)
}

infix operator - { associativity left precedence 250 }
func - (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("- ?", params: [rhs])
}

func - (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("-")
    return ret.append(rhs)
}

infix operator << { associativity left precedence 249 }
func << (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("<< ?", params: [rhs])
}

func << (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("<<")
    return ret.append(rhs)
}
infix operator >> { associativity left precedence 249 }
func >> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append(">> ?", params: [rhs])
}

func >> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append(">>")
    return ret.append(rhs)
}
infix operator & { associativity left precedence 249 }
func & (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("& ?", params: [rhs])
}

func & (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("&")
    return ret.append(rhs)
}
infix operator | { associativity left precedence 249 }
func | (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("| ?", params: [rhs])
}

func | (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("|")
    return ret.append(rhs)
}

infix operator < { associativity left precedence 248 }
func < (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("< ?", params: [rhs])
}

func < (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("<")
    return ret.append(rhs)
}

infix operator <= { associativity left precedence 248 }
func <= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("<= ?", params: [rhs])
}

func <= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("<=")
    return ret.append(rhs)
}

infix operator > { associativity left precedence 248 }
func > (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("> ?", params: [rhs])
}

func > (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append(">")
    return ret.append(rhs)
}

infix operator >= { associativity left precedence 248 }
func >= (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append(">= ?", params: [rhs])
}

func >= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append(">=")
    return ret.append(rhs)
}

infix operator == { associativity left precedence 247 }
func == (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("== ?", params: [rhs])
}

func == (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("==")
    return ret.append(rhs)
}

infix operator <> { associativity left precedence 247 }
func <> (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("<> ?", params: [rhs])
}

func <> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("<>")
    return ret.append(rhs)
}

infix operator != { associativity left precedence 247 }
func != (lhs: SQLStmt, rhs: AnyObject) -> SQLStmt{
    return lhs.copy().append("!= ?", params: [rhs])
}

func != (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = lhs.copy()
    ret.append("!=")
    return ret.append(rhs)
}

infix operator &&& { associativity left precedence 246 }
func &&& (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    return enclosed(lhs, and(), rhs)
}

infix operator ||| { associativity left precedence 246 }
func ||| (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    return enclosed(lhs, or(), rhs)
}
