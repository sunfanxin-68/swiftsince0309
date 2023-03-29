//: [Previous](@previous)

import Foundation

//当我们要调用一个包含在optional中的对象的方法时，我们可能nil和非nil把两种情况分开处理：

//我们要保存swift全部为大写的结果
var swift: String? = "Swift"//先定义一个常量保存结果
let SWIFT: String?

if let swift = swift { //使用if let 保存swift中的值
    SWIFT = swift.uppercased() //如果不为nil
}
else {
    fatalError("不能大写nil")//否则就打一个运行时错误
}
extension String {
    func toUppercase() -> String? {
        guard !self.isEmpty else {return nil }
        
        return self.uppercased()
    }
}

let SWIFT1 = swift?.toUppercase()?.lowercased()
//得到一个新的Optional。并且，我们还可以把optional对象的方法调用串联起来：
print(SWIFT1)
//上面的形式，在Swift里，就叫做optional chaining。


//Nil coalescing

//如果我们希望在optional的值为nil时设定一个默认值
var userInput: String? = nil
//let username = userInput != nil ? userInput! : "Mars"

let username = userInput ?? "Mars"
// ?? 就叫做nil coalescing操作符，optional的值必须写在左边，nil时的默认值必须写在右边


let a: String? = nil
let b: String? = nil
let c: String? = "C"

//let theFirstNonNilString = a ?? b ?? c
// Optional("C")
//let theFirstNonNilString = a ?? b ?? "C"  String C
if let theFirstNonNilString = a ?? b ?? c {
    print(theFirstNonNilString) // C
}
//要比你在if条件分支中，写上一堆||直观和美观多了。



