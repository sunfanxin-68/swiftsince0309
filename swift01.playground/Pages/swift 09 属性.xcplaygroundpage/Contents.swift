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

