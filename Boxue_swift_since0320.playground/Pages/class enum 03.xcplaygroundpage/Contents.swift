//: [Previous](@previous)

import Foundation

//定义一个表达HTTP action的enum：
enum HTTPAction {
    case get  //表示请求一个页面
    case post(String)  //提交的内容 associated value
    case delete(Int, String)  //包含一个ID和确认删除的信息
}
var action1 = HTTPAction.get
var action2 = HTTPAction.post("BOXUE")

switch action1 {
case .get:
    print("HTTP GET")

    //不是每一个case必须有associated value，例如.get就只有自己的enum value；
    
case let .post(msg):
    print("\(msg)")
//当我们想“提取”associated value的所有内容时，
//我们可以把let或var写在case后面，例如.post的用法；

case .delete(let id, let data):
    print("id = \(id), data = \(data)")
}
//当我们想分别“提取”associated value中的某些值时，我们可以把let或var写在associated value里面，例如.delete的用法；

//enum是一个值类型，也可以是一个引用类型
//一种特殊的情况，可以改变enum的这个属性。例如，我们之前实现过的链表：
enum List {
    case end //表示链表的末尾
    indirect case node(Int, next: List)
    //表示链表的普通节点 next 表示下一个节点的引用
}

/*
 使用indirect修饰一个case，这样当一个List为case node时，它就变成了一个引用类型，多个case node可以指向同一个List对象：
 */

let end = List.end
let list1 = List.node(1, next: end)
let list2 = List.node(2, next: end)
//此时，list1和list2就指向了同一个end对象。 都是引用类型



enum Direction: IntegerLiteralType {
    case EAST  = 1
    case SOUTH = 2
    case WEST  = 3
    case NORTH = 4  //Raw value
    
}

let NORTH = Direction.north

/*
 如果编译器可以通过type inference可以推导出enum的类型，
 我们可以在读取值的时候，省掉enum的名字：
 */
func direction(val: Direction) -> String {
    switch val {
    case .north, .south:
        return "up down"
    case .east, .west:
        return "left right"
    }
}



enum Months: IntegerLiteralType {
    
   case january = 1, februray, march,
        april, may, june, july,
        august, september, october,
        november, december

    let JAN = Month.january

    let JAN = Month.January.rawValue
