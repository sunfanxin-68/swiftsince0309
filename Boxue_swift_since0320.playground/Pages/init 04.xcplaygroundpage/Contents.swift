//: [Previous](@previous)

import Foundation

class Person {
    var name: String  //表示姓名的属性
    
    
    init(name: String) { //memberwise init方法
        self.name = name
    }
}

class Employee: Person { //表示员工的类 person的派生类
    var staffNumber: Int
//派生类的init方法
    init(name: String, staffNumber: Int) {
//两个属性一个用来初始化员工名字，一个初始化员工工号
        self.staffNumber = staffNumber
//先初始化派生类的部分  再用super调用基类的init方法
        super.init(name: name)//来初始化基类的属性
    }
}

func printName(of person: Person) {
    print(person.name)
}

let mars = Person(name: "Mars")
let jeff = Employee(name: "Jeff", staffNumber: 23)

printName(of: mars) // Mars
printName(of: jeff) // Jeff


func printNumber(of employee: Employee) {
    print(employee.staffNumber)
}

printNumber(of: jeff) // 23
//printNumber(of: mars) // compile time error


class Bird {
    func fly() {}
}

class FlyingBird: Bird {
    override func fly() {}
}

class Penguin: Bird {
    override func fly() {
        fatalError("Penguin cannot fly.")
    }
}



class Rectangle {
    var w: Double  //属性 矩形的宽和高
    var h : Double
    
    init(w:Double, h: Double) { //memberwise init方法
        self.w = w
        self.h = h
    }
}
// 定义正方形 recrangle的派生类
class Square: Rectangle {
    init(edge: Double) {
        super.init(w:edge, h: edge)
    }
}

func scaleWidth(of rect: Rectangle) {//增加矩形宽度的方法
    let oldHeight = rect.h  //保存它的高度
    rect.w *= 1.1 //宽度增加百分之十
    
    assert(oldHeight == rect.h)
    //确保矩形高度不会被修改的断言
}

var s11 = Square(edge: 11)
scaleWidth(of: s11)

/*
 一旦我们让它们之间存在了继承关系，却是意味着所有适用于Rectangle的方法，都一定适用于Square。
 */
