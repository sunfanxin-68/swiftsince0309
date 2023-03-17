//: [Previous](@previous)

import Foundation

//: [Next](@next)
//可选链（Optional Chaining）是一种可以请求和调用属性
//方法和子脚本的过程，用于请求或调用的目标可能为nil。
class Person {
    var residence:  Residence?
}
class Residence {
    var numberOfRooms = 1
}
let john = Person()
//let roomCount = john.residence!.numberOfRooms
//将导致运行时错误

// 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("无法检索房间数量。")
}
john.residence = Residence()

