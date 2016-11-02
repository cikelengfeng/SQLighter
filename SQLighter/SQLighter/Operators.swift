import Foundation

public protocol FMDBConvertable {
    func toAnyObject() -> AnyObject
}

extension Int: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int)
    }
}

extension Int8: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int8)
    }
}

extension Int16: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int16)
    }
}

extension Int32: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int32)
    }
}

extension Int64: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Int64)
    }
}

extension UInt: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt)
    }
}

extension UInt8: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt8)
    }
}

extension UInt16: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt16)
    }
}

extension UInt32: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt32)
    }
}

extension UInt64: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as UInt64)
    }
}

extension Float: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Float)
    }
}

extension Double: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return NSNumber(value: self as Double)
    }
}

extension String: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return self as NSString
    }
}

extension NSNumber: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return self
    }
}

extension Date: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return self as NSDate
    }
}

extension Data: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return self as NSData
    }
}

extension URL: FMDBConvertable {
    public func toAnyObject() -> AnyObject {
        return self as NSURL
    }
}

func || <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").value(rhs)
}

func || (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("||").append(rhs)
}

func * <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").value(rhs)
}

func * (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("*").append(rhs)
}

//infix operator / { associativity none }
func / <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").value(rhs)
}

func / (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("/").append(rhs)
}

//infix operator % { associativity none }
func % <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").value(rhs)
}

func % (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("%").append(rhs)
}

//infix operator + { associativity none }
func + <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").value(rhs)
}

func + (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("+").append(rhs)
}

//infix operator - { associativity none }
func - <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").value(rhs)
}

func - (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("-").append(rhs)
}

//infix operator << { associativity none }
func << <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").value(rhs)
}

func << (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<<").append(rhs)
}
//infix operator >> { associativity none }
func >> <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").value(rhs)
}

func >> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">>").append(rhs)
}
//infix operator & { associativity none }
func & <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").value(rhs)
}

func & (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("&").append(rhs)
}
//infix operator | { associativity none }
func | <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").value(rhs)
}

func | (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("|").append(rhs)
}

//infix operator < { associativity none }
func < <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").value(rhs)
}

func < (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<").append(rhs)
}

//infix operator <= { associativity none }
func <= <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").value(rhs)
}

func <= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<=").append(rhs)
}

//infix operator > { associativity none }
func > <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").value(rhs)
}

func > (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">").append(rhs)
}

//infix operator >= { associativity none }
func >= <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").value(rhs)
}

func >= (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append(">=").append(rhs)
}

//infix operator == { associativity none }
func == <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").value(rhs)
}

func == (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("==").append(rhs)
}

infix operator <> { associativity none}
func <> <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").value(rhs)
}

func <> (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("<>").append(rhs)
}

//infix operator != { associativity none }
func != <T: FMDBConvertable>(lhs: SQLStmt, rhs: T) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").value(rhs)
}

func != (lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt{
    let ret = SQLStmt()
    return ret.append(lhs).append("!=").append(rhs)
}

