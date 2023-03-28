//: [Previous](@previous)

import Foundation


func incremental(_ i: inout Int) -> Int {
    i = i + 1
    return i
}
var i = 0
incremental(&i) 
/*
 被inout修饰的参数只是被传递给函数，被修改后，再替换了初始值而已。当然，也许按引用传递是编译器采取的某种优化手段，但是你不能依赖这个特性。总之，inout就真的只是in out而已。
 */
 
struct Color {
    var r: Int
    var g: Int
    var b: Int
}

var red = Color(r: 254, g: 0, b: 0)
incremental(&red.r)
