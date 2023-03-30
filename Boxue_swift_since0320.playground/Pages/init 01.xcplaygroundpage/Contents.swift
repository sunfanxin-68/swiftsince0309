//: [Previous](@previous)

import Foundation

struct PointValue {
    var x: Int
    var y: Int
}

class PointRef {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func move(to: PointRef) {
           self.x = to.x
           self.y = to.y
       }
    
    
}




//引用类型关注的是对象本身
//class和struct对“常量”的理解是不同的。我们分别定义一个PointRef和PointValue的常量：
let p1 = PointRef(x: 0, y: 0)
let p2 = PointValue(x: 0, y: 0)

//p2.x = 10  Compile time error
//p2作为一个值类型，常量的意义当然是：“它的值不能被改变”

p1.x = 10 // OK
/*
 但是p1作为一个引用类型，常量的意义则变成了，它可以修改自身的属性，但不能再引用其他的PointRef对象。如果我们尝试让p1引用另外一个PointRef对象，就会发生下面的错误：
 */
//p1 = PointRef(x: 1, y: 1) // Compile time error

var p3 = p1
var p4 = p2

p1 === p3 // true 当我们修改了p3之后，p1的值，会一并修改：
p3.x = 10
p1.x // 10
