//: [Previous](@previous)

import Foundation

var i = 10
var captureI = { print(i) } //等于一个closure
i += 1

captureI()

class Demo { var value = "" }

var demo = Demo()
var captureDemo = { [demo] in print(demo.value) }
demo.value = "updated"

demo = Demo()
//closure捕获的是它访问的变量，也就是demo的引用，而不是demo引用的对象。
captureDemo()

/*
 无论是值类型i还是引用类型c，closure捕获到的都是它们的引用，这也是为数不多的值类型变量有引用语义的地方；
 Closure内表达式的值，是在closure被调用的时候才评估的，而不是在closure定义的时候评估的；
 */


//Closure为什么会带来引用循环

class Role {
    var name: String
    var action: () -> Void = { }
    /*
     它有两个属性：
     name表示角色的名称；
     action表示角色执行的动作；
     */

    init(_ name: String = "Foo") {
        self.name = name
        print("\(self) init")
    }

    deinit {
        print("\(self) deinit")
    }
}

extension Role: CustomStringConvertible {
//让它实现了CustomStringConvertible
    var description: String {
        return "<Role: \(name)>"
    }
}

if true {
    var boss = Role("boss")
    let fn = {
        print("\(boss) takes this action.")
    }

    boss.action = fn
}
//在fn里，我们捕获了boss，因此，closure对象就有了一个指向boss变量的strong reference。
//boss.action = fn让action也成了closure对象的strong reference。此时，Role的引用计数是1，closure对象的引用计数是2。

var j = 10
var captureJ = { [j] in print(j) }
j = 11

captureJ() // 10
//这叫做closure的capture list，它的作用就是让closure按值语义捕获变量
//因此，当我们执行captureJ()时，打印的结果就变成了10，这是captureJ在定义时变量i的值。
//闭包捕获列表（Closure Capture List）可以用于在闭包内声明捕获变量的访问级别，以及明确指定将变量作为值类型（捕获值）还是引用类型（捕获引用）来捕获。
