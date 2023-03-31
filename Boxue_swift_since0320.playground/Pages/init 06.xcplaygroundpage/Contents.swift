//: [Previous](@previous)

import Foundation


class Shape {
    enum Color { case red, yellow, green }
    
    func doDraw(color: Color = .red) {
        print("A \(color) shape.")
    }
}
/*
 由于draw(:Color)定义在extension里，它不可以被派生类重写。但我们可以重定义没有默认参数的doDraw(:Color)方法：
 */
/*
 它的draw方法带有一个有默认值.red的参数。为了示意，我们向控制台打印了带有形状颜色的消息。接下来，我们再定义两个Shape的派生类，分别表示方形和圆形：
 */
extension Shape {
    func draw(color: Color = .red) {
        doDraw(color: color)
    }
}


class Square: Shape {
    override func doDraw(color: Color) {
        print("A \(color) square.")
    }
//我们就变相实现了在派生类中重写方法的同时，还保留了基类API默认参数的效果。
}

class Circle: Shape {
    override func doDraw(color: Color) {
//把默认颜色改成green。把打印改成circle
        print("A \(color) circle.")
    }
}

//let s = Square()
//let c = Circle()
//
//s.draw() // A yellow square
//c.draw() // a green circle

let s: Shape = Square()
let c: Shape = Circle()

s.draw() // A red square.
c.draw() // A red circle.
