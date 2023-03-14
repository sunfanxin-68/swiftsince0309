//: [Previous](@previous)

import Foundation

//: [Next](@next)

//闭包 Sorted方法
let names = ["2", "6", "7", "9", "-4"]
func backward(_ s1: String, _ s2:  String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
//排序用闭包

let divide = {(val1: Int, val2: Int) -> Int in
    return val1 + val2
}
let result = divide(5, 3)

reversedNames = names.sorted(by:{ (s1: String, s2: String) -> Bool in
return s1 > s2
})


