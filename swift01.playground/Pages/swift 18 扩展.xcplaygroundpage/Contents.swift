//: [Previous](@previous)

import Foundation
//: [Next](@next)
/*扩展可以给一个现有的类，结构体，枚举，还有协议添加新的功能。它还拥有不需要访问被扩展类型源代码就能完成扩展的能力（即逆向建模）
 Swift 中的扩展可以：

 添加计算型实例属性和计算型类属性

 定义实例方法和类方法

 提供新的构造器

 定义下标

 定义和使用新的嵌套类型

*/

//使用 extension 关键字声明扩展：
//extension SomeType {
//    // 在这里给 SomeType 添加新的功能
//}
//extension SomeType: SomeProtocol, AnotherProtocol {
//    // 协议所需要的实现写在这里
//}

//给 Swift 内建的 Double 类型添加了五个计算型实例属性，
extension Double {
    var km:Double { return self * 1_000.0}
    var m: Double{ return self }
    var cm: Double { return self / 100.0}
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let  oneInch = 25.4.mm
print("One inch is \(oneInch)meters")//0.254 / 1000

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")//3 / 3.28084

let aMarathon = 42.km + 195.m
print("一场马拉松是\(aMarathon)米长")

/*自定义了一个的 Rect 结构体用来表示一个几何矩形。这个例子中还定义了两个给予支持的结构体 Size 和 Point，它们都把属性的默认值设置为 0.0：*/
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
/*因为 Rect 结构体给所有的属性都提供了默认值，
 所以它自动获得了一个默认构造器和一个成员构造器，
 就像 默认构造器 中描述的一样。这些构造器可以用来创建新的 Rect 实例：*/

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

//可以通过扩展 Rect 结构体来提供一个允许指定 point 和 size 的构造器：
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
//方法
//扩展可以给现有类型添加新的实例方法和类方法。
//在下面的例子中，给 Int 类型添加了一个新的实例方法叫做 repetitions：

extension Int {
    func repetitions(task: () -> Void) {
        //表示一个没有参数没有返回值的方法。
        for _ in 0..<self {
            task()
        }
    }
}
/*定义了这个扩展之后，你可以对任意整形数值调用
 repetitions(task:) 方法，来执行对应次数的任务：*/
6.repetitions {
    print("おはよう")
}

//可变实例方法
/*结构体和枚举的方法，若是可以修改 self 或者它自己的属性，则必须将这个实例方法标记为 mutating，就像是改变了方法的原始实现。*/
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()


/*下标
 
 扩展可以给现有的类型添加新的下标。下面的例子中，对 Swift 的 Int 类型添加了一个整数类型的下标。
 下标 [n] 从数字右侧开始，返回小数点后的第 n 位：*/

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return(self / decimalBase) % 10
    }
}
746381295[0] //下标 [n] 从数字右侧开始，返回小数点后的第 n 位：
//print 5
746381295[1]
746381295[2]

//嵌套类型
//扩展可以给现有的类，结构体，还有枚举添加新的嵌套类型：
extension Int {
    enum Kind {
        case negative,zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
/*
 给 Int 添加了一个新的嵌套枚举。这个枚举叫做 Kind，表示特定整数所代表的数字类型。具体来说，它表示数字是负的、零的还是正的。
 */
func printInteregerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("_", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case.positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printInteregerKinds([3, 19, -27, 0, -6, 0, 7])
/*printIntegerKinds(_:)，使用一个 Int 类型的数组作为输入，然后依次迭代这些值。对于数组中的每一个整数，方法会检查它的 kind 计算型属性，然后打印适当的描述。*/
