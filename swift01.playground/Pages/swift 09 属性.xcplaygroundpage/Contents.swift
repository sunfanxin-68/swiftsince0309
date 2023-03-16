//: [Previous](@previous)

import Foundation

//: [Next](@next)
struct Number
{
//1个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。
    var digits:Int
    let pi = 3.1415
    //可以在定义存储属性的时候指定默认值
}
//也可以在构造过程中设置或修改存储属性的值，甚至修改常量存储属性的值
var n = Number(digits: 123456)
n.digits = 67
print(n.digits)
print(n.pi)

//延迟存储属性 在属性声明前使用 lazy 来标示一个延迟存储属性。
class sample {
    lazy var no = numbers() // `var` 关键字是必须的
    //当属性的值依赖于其他未知类
}
class numbers {
    var name = "swift 属性"
    //延迟对象的创建。
}
var firstsample = sample()
print(firstsample.no.name)

class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
     lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("some more data")
print(manager.importer.fileName)

//计算属性
//提供一个 getter 来获取值，一个可选的setter来间接设置其他属性或变量的值。
class sample2 {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    var middle: (Double,Double) {
        get{
            return(length / 2, breadth / 2)
        }
        set(newValue){
            no1 = newValue.0 - (length / 2)// 100-150=-50
            no2 = newValue.1 - ( breadth / 2)//10-（150/2）= -65
        }
    }
}
var result = sample2()
print(result.middle)//从get里头运算
result.middle = (100.0, 10.0)

print(result.no1)
print(result.no2)


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x:centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x:0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x:15.0, y: 15.0)
print("直角坐标现在是(\(square.origin.x),\(square.origin.y)")

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

class film {
    var head = ""
    var duration = ""
    var metaInfo: [String:String] {
        return [
            "head": self.head,
            "duration": self.duration
        ]
    }
}
var movie = film()
movie.head = "Swift 属性"
movie.duration = "39"

print(movie.metaInfo["head"]!)
print(movie.metaInfo["duration"]!)

//属性观察器
//willSet在设置新的值之前调用
//didSet在新的值被设置之后立即调用
//willSet和didSet观察器在属性初始化过程中不会被调用

class Samplepgm {
    var counter: Int = 0 {
        willSet(newTotal) {
            print("计数器: \(newTotal)")
        }
        didSet {
            if counter > oldValue {
                print("新增数\(counter - oldValue)")
            }
        }
    }
}
let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("总步数为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("增加了\(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()//调用方法
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300
stepCounter.totalSteps = 500

//获取和设置类型属性的值.类型属性是通过类型本身来获取和设置，而不是通过实例
struct StudMarks {
    static let markCount = 5
    static var totalCount = 0
    var InternalMarks: Int = 0 {
        didSet {
            if InternalMarks > StudMarks.markCount {
                InternalMarks = StudMarks.markCount
            }
            if InternalMarks > StudMarks.totalCount {
                StudMarks.totalCount = InternalMarks
            }
        }
    }
}
var stud1Mark1 = StudMarks()
var stud1Mark2 = StudMarks()

stud1Mark1.InternalMarks = 8
print(stud1Mark1.InternalMarks)

stud1Mark2.InternalMarks = 2
print(stud1Mark2.InternalMarks)
