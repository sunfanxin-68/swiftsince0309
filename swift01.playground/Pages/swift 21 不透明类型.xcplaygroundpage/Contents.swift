//: [Previous](@previous)

import Foundation

//: [Next](@next)
/*不透明类型解决的问题
 举个例子，假设你正在写一个模块，用来绘制 ASCII 符号构成的几何图形。它的基本特征是有一个 draw() 方法，会返回一个代表最终几何图形的字符串，你可以用包含这个方法的 Shape 协议来描述：
*/
protocol Shape {
    func draw() -> String
}
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "☆", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlipperShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator:"\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlipperShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())

