//: [Previous](@previous)

import Foundation

//: [Next](@next)
/*访问控制语法
 通过修饰符 open、public、internal、fileprivate、private 来声明实体的访问级别：*/
public class SomePublic {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePriavateFunction() {}
private func somePrivateFunction() {}


public class SomePublicClass {     // 显式 public 类
    public var somePublicProperty = 0   // 显式 public 类成员
    var someInternalProperty = 0   // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}
    // 显式 fileprivate 类成员
    private func somePrivateMethod() {}
    // 显式 private 类成员
}

class someInternalClass {                  // 隐式 internal 类
    var someInternalProperty = 0          // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}
    // 显式 fileprivate 类成员
    private func somePrivateMethod() {}    // 显式 private 类成员
}
fileprivate class someFilePrivateClass {
  // 显式 fileprivate 类
    func someFilePrivateMethod() {}  // 隐式 fileprivate 类成员
    private func somePrivateMethod() {} // 显式 private 类成员
}

private class somePrivateClass {         // 显式 private 类
    func somePrivateMethod() {}          // 隐式 private 类成员
}


/*
 类 A 的访问级别是 public，它包含一个方法 someMethod()，访问级别为 fileprivate
 */

public class A {
    fileprivate func someMethod() {}
}
/*
 类 B 继承自类 A，访问级别为 internal，但是在类 B 中重写了类 A 中访问级别为 fileprivate 的方法 someMethod()，并重新指定为 internal 级别
 */
internal class B: A {
    override internal func someMethod() {}
}


//如果常量、变量、属性或下标由private类型组成，那么常量、变量、属性或下标也要被标注为 private ：

private var privateInstance = SomePrivateClass()

/*
 Getter 和 Setter

 常量、变量、属性、下标的 Getters 和 Setters 的访问级别和它们所属类型的访问级别相同。
 */
//定义了一个名为 TrackedString 的结构体，它记录了 value 属性被修改的次数：
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = " " {
        didSet {
            numberOfEdits += 1
        }
    }
}
class Samplepgm {
    fileprivate var counter: Int = 0{
        willSet(newTotal) {
            print("计数器: \(newTotal)")
        }
        didSet {
            if counter > oldValue {
                print("新增加数量\(counter - oldValue)")
            }
        }
    }
}
//counter 的访问级别为 fileprivate，在文件内可以访问。
let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800

