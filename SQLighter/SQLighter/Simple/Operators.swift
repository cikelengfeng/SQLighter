import Foundation

protocol FMDBConvertable {
    func toAnyObject() -> AnyObject
}

extension Int: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(long: self)
    }
}

extension Int8: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(char: self)
    }
}

extension Int16: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(short: self)
    }
}

extension Int32: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(int: self)
    }
}

extension Int64: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(longLong: self)
    }
}

extension UInt: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(unsignedLong: self)
    }
}

extension UInt8: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(unsignedChar: self)
    }
}

extension UInt16: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(unsignedShort: self)
    }
}

extension UInt32: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(unsignedInt: self)
    }
}

extension UInt64: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(unsignedLongLong: self)
    }
}

extension Float: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(float: self)
    }
}

extension Double: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return NSNumber(double: self)
    }
}

extension String: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self
    }
}

extension NSNumber: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self
    }
}

extension NSDate: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self
    }
}

extension NSData: FMDBConvertable {
    func toAnyObject() -> AnyObject {
        return self
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

