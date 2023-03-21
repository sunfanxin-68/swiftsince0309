//: [Previous](@previous)

import Foundation

/*
 匹配值的方式

 为了演示各种样式匹配的方式，我们先定义一个tuple，表示平面直角坐标系中的原点：
 */
let origin = (x: 0, y: 0)

//当我们要判断某个点是否是原点的时候，最原始的方式，是这样的：
let pt1 = (x: 10, y : 0)
//首先判断两个点x坐标是否相等 和两个点y坐标是否相等
if pt1.x == origin.x && pt1.y == origin.y {
    print("@Origin")
//如果同时相等就可以判断 pt1 在原点的位置了
    
}

// case 后面接上我们要比较的期望值 原点 赋值给pt1
if case (0, 0) = pt1 {
    print("@Origin")
}
//在这里 使用的 case tuple（0， 0）就叫做一个 pattern

switch pt1 {
case (0, 0):
    print("@origin")
case (let x, 0): //管这样的形式叫 value binding
    print("(\(x), 0) is on x axis")
//还可以把匹配到的内容直接绑定到变量上 就可以在相应的case中直接使用它了
    
case (0, _):
    print("on y axis")
case (-1...1, -1...1):
    print("inside 1x1 square")
default:
    break
}
/*
 除了用case (0, 0)表示匹配原点值之外，还可以用(_, 0)和(0, _)表示忽略掉_的部分，
 仅对tuple中某一部分的值进行匹配，或者，在tuple的每一个成员位置，使用range operator匹配值的某个范围。
 */

let array1 = [1, 1, 1, 2, 2, 2,]

for case 2 in array1 {
    print("２を発見")
}


//除了直接绑定变量自身的值之外，我们还可以用类似的形式绑定enum中的关联值。例如，我们先定义一个表示方向的enum
enum Direction {
    case north, south, east, west(abbr: String)//添加一个STring类型的关联值
}
let west = Direction.west(abbr: "W")
//然后定义一个表示西边的变量  并关联一个方向的缩写 W
//我们给.west添加个了一个associated value，表示方向的缩写。然后，我们既可以像这样来判断enum值自身：

if case .west(let direction) = west {
    print(direction)
}
//此时，print打印的就是enum case的值。我们也可以这样来直接绑定west的associated value：

let skills: [String?] =
    ["Swift", nil, "PHP", "JavaScirpt", nil]

for case let skill? in skills {
    print(skill) // 来绑定skill中所有nil的内容
}
//Swift就会自动提取每一个非nil的元素，因此，print会输出“Swift PHP JavaScript”。

/*
 自动提取optional的值
 除了绑定enum的associated value之外，我们还可以使用case来自动提取optional类型的非空值：
*/
let someValues: [Any] = [1, 1.0, "One"]
for value in someValues {
    switch value {
    case let v as Int:
        print("Integer: \(v)")
    case let v as Double:
        print("Double: \(v)")
        
//如果你仅仅想判断类型，而不需要知道具体内容的话，还可以使用更简单的is操作符：
    case is String:
        print("String型があるよ")
    default:
        print("Invalid value")
    }
}
//在上面的例子中，我们使用了case let Variable as Type的方式，把类型转换成功的结果，绑定在了变量V上。这样，我们就可以在对应的case里，访问到转换成功的值了。
