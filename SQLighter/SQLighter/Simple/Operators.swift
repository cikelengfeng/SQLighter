import Foundation

protocol FMDBConvertable {
    func toAnyObject() -> AnyObject
}

extension Int: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int)
    }
}

extension Int8: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int8)
    }
}

extension Int16: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int16)
    }
}

extension Int32: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int32)
    }
}

extension Int64: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int64)
    }
}

extension UInt: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt)
    }
}

extension UInt8: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt8)
    }
}

extension UInt16: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt16)
    }
}

extension UInt32: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt32)
    }
}

extension UInt64: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt64)
    }
}

extension Float: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Float)
    }
}

extension Double: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Double)
    }
}

extension String: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self as AnyObject
    }
}

extension NSNumber: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self
    }
}

extension Date: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self as AnyObject
    }
}

extension Data: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self as AnyObject
    }
}

func || <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").value(rhs.toAnyObject())
}

func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").append(rhs)
}

func * <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").value(rhs.toAnyObject())
}

func * (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").append(rhs)
}

//infix operator / { associativity none }
func / <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").value(rhs.toAnyObject())
}

func / (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").append(rhs)
}

//infix operator % { associativity none }
func % <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").value(rhs.toAnyObject())
}

func % (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").append(rhs)
}

//infix operator + { associativity none }
func + <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").value(rhs.toAnyObject())
}

func + (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").append(rhs)
}

//infix operator - { associativity none }
func - <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").value(rhs.toAnyObject())
}

func - (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").append(rhs)
}

//infix operator << { associativity none }
func << <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").value(rhs.toAnyObject())
}

func << (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").append(rhs)
}
//infix operator >> { associativity none }
func >> <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").value(rhs.toAnyObject())
}

func >> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").append(rhs)
}
//infix operator & { associativity none }
func & <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").value(rhs.toAnyObject())
}

func & (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").append(rhs)
}
//infix operator | { associativity none }
func | <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").value(rhs.toAnyObject())
}

func | (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").append(rhs)
}

//infix operator < { associativity none }
func < <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").value(rhs.toAnyObject())
}

func < (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").append(rhs)
}

//infix operator <= { associativity none }
func <= <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").value(rhs.toAnyObject())
}

func <= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").append(rhs)
}

//infix operator > { associativity none }
func > <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").value(rhs.toAnyObject())
}

func > (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").append(rhs)
}

//infix operator >= { associativity none }
func >= <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").value(rhs.toAnyObject())
}

func >= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").append(rhs)
}

//infix operator == { associativity none }
func == <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").value(rhs.toAnyObject())
}

func == (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").append(rhs)
}

infix operator <> { associativity none}
func <> <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").value(rhs.toAnyObject())
}

func <> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").append(rhs)
}

//infix operator != { associativity none }
func != <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").value(rhs.toAnyObject())
}

func != (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").append(rhs)
}

