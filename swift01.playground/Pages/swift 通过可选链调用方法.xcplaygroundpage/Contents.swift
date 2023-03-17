//: [Previous](@previous)

import Foundation

//: [Next](@next)

class Person {
    var residence: Residence?
}
// 定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
class Residence {
    var rooms = [Room] ()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        return rooms[i]
    }
    func printNumberOfRooms() {
        print("部屋No.は\(numberOfRooms)")
    }
    var address: Address?
}
// Room 定义一个name属性和一个设定room名的初始化器
class Room {
    let name: String
    init(name: String) {self.name = name}
}

// 模型中的最终类叫做Address
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if (buildingName != nil) {
            return buildingName
        } else if (buildingNumber != nil){
            return buildingNumber
        } else {
            return nil
        }
    }
}
let john = Person ()
/*如果目标有值，调用就会成功，返回该值
 如果目标为nil，调用将返回nil
 多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。
*/
if((john.residence?.printNumberOfRooms()) != nil) {
    print("部屋番号入力")
}else {
    print("部屋番号入力出来ない")
}

