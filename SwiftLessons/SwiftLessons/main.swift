//
//  main.swift
//  SwiftLessons
//
//  Created by gaojuyan on 2017/3/13.
//  Copyright © 2017年 gaojuyan. All rights reserved.
//

import Foundation

print("Hello, World!")

////////// Optional chaining ////////////

class Person {
    
    var residence: Residence?
    
    func run() throws {
        print("person can run")
    }
}

class Room {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


class Residence {
    var rooms = [Room]();
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue;
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

///////// Test

let jack = Person()

var residence = Residence()

residence.rooms.append(Room(name: "room1"))
residence.rooms.append(Room(name: "room2"))

jack.residence = residence

print("room is \(jack.residence?[0].name)")

jack.residence?.printNumberOfRooms()



//////////// Error Handling //////////

// “Propagating Errors Using Throwing Functions”

protocol MyError : Error {
    
    func printError()
    
}

enum VendingMachineError: Error {
    
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


// do-catch statement

func canThrowErrors() throws {
    
    do {
        try jack.run()
    } catch VendingMachineError.invalidSelection {
        print("invalide Selection")
    }catch VendingMachineError.insufficientFunds(coinsNeeded: 10) {
        print("need 10 dollars")
    }catch VendingMachineError.outOfStock {
        print("out of stock")
    }
}

// Converting Errors to Optional Values: try?

func throwOptional() throws -> Int {
    return 1
}


var optionTry = try? throwOptional()

print("optionTry is \(optionTry!)")

// Disabling Error Propagation: try!
// 加上 ! 就不会抛出异常，如果出现异常直接报runtime错误

// Specifying Cleanup Actions: defer
// defer 关键字能推迟代码的执行



/// ****************元类型***************** ///

class SomeClass : NSObject {
    
    var a: String?
    
    init(a: String) {
        self.a = a
    }
    // 类方法的声明有两种方式：static class
    static func ClassType()-> String {
        return "SomeClass"
    }
    
    class func ClassName()-> String {
        return "SomeClass"
    }
    
    
    deinit {
        self.a = ""
    }
}


let someclass = SomeClass(a:"some value")

if type(of:someclass) === SomeClass.self {
    print("same class:\(someclass.self)")
    print("same class:\(SomeClass.self)")
    print("same class:\(type(of:someclass))")
}else {
    print("not same class:\(SomeClass.self)")
    print("not same class:\(type(of:someclass))")
}

print("classType = \(SomeClass.ClassType())")

// 值类型

struct Point3D {
    var x:Float
    var y:Float
    var z:Float
}

var p1 = Point3D(x: 1,y: 2,z: 3)

var p2 = p1   // 因为是值类型，这里相当于C++里的拷贝构造函数，生成一个新的对象,并将值赋给每个成员变量
p2.x = 55

print("p1.x = \(p1.x), p2.x = \(p2.x)")


// 扩展：extension
// 可以添加计算属性，可以添加方法，可以使得已存在的类符合一个协议；
// 不可以添加存储属性，不可以给已有的属性添加观察器

extension Double : MyError {
    
    // internal 这个关键字
    internal func printError() {
        print("no error!")
    }
    
    // 这里只能用static关键字，class只能用在类中
    static func AbsoluteValue() -> String {
        return String(describing: self)
    }
}


// protocol

protocol FullNamed {
    var fullName: String { get }
}

struct Student: FullNamed {
    
    var fullName: String
    
}

var std = Student(fullName: "sky")
print(std.fullName)


// let ii: Int32 = -1
// Int32.max: 2147483647
// Int64.max: 9223372036854775807
// print("int32: \(Int64.max)")

// protocol as a type can use in many places allowed:
/*
 
 1.As a parameter type or return type in a function, method, or initializer”
 
 2.As the type of a constant, variable, or property
 
 3.As the type of items in an array, dictionary, or other container
 
 */

// Protocol Inheritance
/* A protocol can inherit one or more other protocols and can add further
 requirements on top of the requirements it inherits.
 */

// Class-Only Protocols
/*
 You can limit protocol adoption to class types (and not structures or enumerations) by adding
 the class keyword to a protocol’s inheritance list. The class keyword must always appear first
 in a protocol’s inheritance list, before any inherited protocols:
 
 protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
 // class-only protocol definition goes here
 }
 */

// Protocol Composition
/*
 Protocol compositions have the form SomeProtocol & AnotherProtocol.
 You can list as many protocols as you need to,separating them by ampersands(&).
 
 Protocol compositions do not define a new, permanent protocol type.
 Rather, they define a temporary local protocol that has the combined requirements of
 all protocols in the composition.
 
 */

// Optional Protocol Requirements
/*
 Optional requirements are prefixed by the optional modifier as part of the protocol’s definition.
 
 */

// Providing Default Implementations
/*
 You can use protocol extensions to provide a default implementation to
 any method or computed property requirement of that protocol.
 */


//////////////////////////**Generics**//////////////////////////

// 补充：URL
var url: NSURL = NSURL(string: "http://www.baidu.com:8080/articles/AB7jqeY?id=1000&count=900&selector=search#some")!
print("query: \(url.query)") // print query: Optional("id=1000&count=900&selector=search")

print("host:\(url.host), port:\(url.port)") // print host:Optional("www.baidu.com"), port:Optional(8080)

print("fragment:\(url.fragment), parameterString:\(url.parameterString)")
// print fragment:Optional("some"), parameterString:nil

print("path:\(url.path)")  // print path:Optional("/articles/AB7jqeY")

// Type Parameters  Generic function  Naming Type Parameters  Generic Types
// Extending a Generic Type  Type Constraints
// Associated Types(use associatedtype keyword)
// Generic Where Clauses(uses where keyword)




//////////////////////////Access Control////////////////////////////////
// Modules and Source Files
// Access Levels: open,public,inernal,fileprivate,private
// Default Access Levels: internal
// Tuple Types: treat
// Function Types
// Enumeration Types
// Raw Values and Associated Values
// Nested Types
// A constant,variable,or property cannot be more public than its type.
/* You can give a setter a lower access level than its corresponding getter,
 to restrict the read-write scope of that variable,property.or subscript.
 e.g:fileprivate(set),private(set),internal(set)
 */

/* Initailizers->
 Required Initailizers:
 Default Initailizers: internal
 Default Memberwise Initailizers for Structure Types:
 
 */

// Adapter

protocol Printer {
    func doPrint()
}

class HPPrinter: Printer {
    func doPrint() {
        print("HP printer is printing")
    }
}


func printWork(printer:Printer) {
    printer.doPrint()
}

let printer = HPPrinter()
printWork(printer: printer)


/// operator

let op = OperatorLesson()
op.sumOfOperator = 19
op.runOverflow()
op.runPrecedence()
let op2 = OperatorLesson()
op2.sumOfOperator = 19;
var op3 = op + op2
print("op's sumOfOperator is \(op.sumOfOperator)")
print("op2's sumOfOperator is \(op2.sumOfOperator)")
print("op3's sumOfOperator is \(op3.sumOfOperator)")
if op == op2 {
    print("op is same to op2")
}else {
    print("op is not same to op2")
}
