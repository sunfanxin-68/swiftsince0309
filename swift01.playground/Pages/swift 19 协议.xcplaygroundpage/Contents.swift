//: [Previous](@previous)

import Foundation
//: [Next](@next)

/*
 协议 定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某个协议的要求，就可以说该类型遵循这个协议。

 */
/*对属性的规定
 协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。
 此外还必须指明是只读的还是可读可写的。
 协议中的通常用var来声明变量属性，
 在类型声明后加上{ set get }来表示属性是可读可写的，
 只读属性则用{ get }来表示。*/

protocol classa {
    var marks: Int { get set }
    var result: Bool { get }
    
    func attendance() -> String
    func markssecured() -> String
    
    }
protocol classb: classa {
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
}

class classc: classb {
    var marks = 96
    let result = true
    var present = false
    var subject = "swift协议"
    var stname = "Protocols"
    func attendance() -> String {
            return "The \(stname) has secured 99% attendance"
        }
        
        func markssecured() -> String {
            return "\(stname) has scored \(marks)"
        }
    }

let studdet = classc()
studdet.stname = "Swift"
studdet.marks = 98
studdet.markssecured()

print(studdet.marks)
print(studdet.result)
print(studdet.present)
print(studdet.subject)
print(studdet.stname)

/*对 Mutating 方法的规定
 有时需要在方法中改变它的实例。
 例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值。*/
protocol daysofaweek {
    mutating func show ()
}
enum days: daysofaweek {
    case sun, mon, tue, wed, thurs, fri, sat
    mutating func show() {
        switch self {
        case.sun:
            self = .sun
            print("Sunday")
        case.mon:
            print("Monday")
        case.tue:
            self = .tue
            print("Tuesday")
        case .wed:
            self = .wed
            print("Wednesday")
        case .thurs:
            self = .thurs
            print("Wednesday")
        case .fri:
            self = .fri
            print("Firday")
        case .sat:
            self = .sat
            print("Saturday")
        default:
            print("NO Such Day")
            
        }
    }
}
var res = days.wed
res.show()

protocol tcpprotocol {
    init(no1: Int)
}
class mainClass {
    var no1: Int //局部变量
    init(no1: Int) {
        self.no1 = no1 //初始化
    }
}

class subClass: mainClass, tcpprotocol {
    var no2: Int
    init(no1: Int, no2: Int) {
        self.no2 = no2
        super.init(no1:no1)
    }
    // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
    required override convenience init(no1: Int) {
        self.init(no1: no1, no2: 0)
    }
}
let ress = mainClass(no1: 20)
let show = subClass(no1: 30, no2: 50)

print("res is: \(ress.no1)")
print("res is: \(show.no1)")
print("res is: \(show.no2)")

/*协议类型
 尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。
 协议可以像其他普通类型一样使用，使用场景:
 作为函数、方法或构造器中的参数类型或返回值类型
 作为常量、变量或属性的类型
 作为数组、字典或其他容器中的元素类型
 */

protocol Generator {
    associatedtype members
    func next() -> members?
}

var items = [10,20,30].makeIterator()
while let x = items.next() {
    print(x)
}
for lists in [1,2,3].map( {i in i * 5}){
    print(lists)
}
print([100,200,300])
print([1,2,3].map({i in i * 10}))


/*在扩展中添加协议成员
 我们可以可以通过扩展来扩充已存在类型( 类，结构体，枚举等)。
 扩展可以为已存在的类型添加属性，方法，下标脚本，协议等成员。*/
protocol AgeClasificationProtocol {
    var age: Int{ get }
    func agetype() -> String
}
class Person {
    let firstname: String
    let lastname: String
    var age: Int
    init(firstname: String, lastname: String){
        self.firstname = firstname
        self.lastname = lastname
        self.age = 10
        
    }
}
extension Person : AgeClasificationProtocol {
    func fullname() -> String {
        var c: String
        c = firstname + " " + lastname
        return c
        
    }
    func agetype() -> String {
        switch age {
        case 0...2:
            return "Baby"
        case 2...12:
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}
//协议作为类型

//class Dice {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//    func roll() -> Int {
//        return Int(generator.random() * Double(sides)) + 1
//    }
//}
//var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("Random dice roll is \(d6.roll())")
//}


//这个例子定义了一个叫做 Named 的协议，
//它只有一个叫做 name 的可读 String 属性要求
protocol Named {
    var name: String { get }
}
/*它同样定义了一个叫做 Aged 的协议，只有一个叫做 age 的 Int 属性要求。两个协议都被叫做 Person 的结构体采纳。*/
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("お誕生日おめでどう, \(celebrator.name),\(celebrator.age)歳になったね")
}
/*然后例子中又创建了一个新的叫做 birthdayPerson 的 Person 实例并且把这个新的实例传入 wishHappyBirthday(to:) 函数。由于 Person 同时遵循两个协议，所以这是合法调用，并且 wishHappyBirthday(to:) 函数能够打印出生日祝福。*/
let birthdayPerson = Person2(name: "鈴木さん", age:21)
wishHappyBirthday(to: birthdayPerson)


class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("こんにちは,\(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

//协议遵循的检查
//定义了一个叫做 HasArea 的协议，
//只有一个叫做 area 的可读 Double 属性要求：

protocol HasArea {
    var area: Double { get }
}
//这里有两个类， Circle 和 Country ，这两个类都遵循 HasArea 协议：
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double){ self.radius = radius}
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
/*Circle 类基于存储属性 radius 用计算属性实现了 area 属性要求。
Country 类则直接使用存储属性实现了 area 要求。
这两个类都正确地遵循了 HasArea 协议。*/
//这里是一个叫做 Animal 的类，它不遵循 HasArea 协议：
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
//Circle 、 Country 和 Animal 类并不基于相同的基类。不过它们都是类，所以它们三个类型的实例都可以用于初始化储存类型为 AnyObject 的数组：
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
//objects 数组现在可以遍历了，而且数组中每一个对象都能检查是否遵循 HasArea 协议：
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesen`t have an area")
    }
}
