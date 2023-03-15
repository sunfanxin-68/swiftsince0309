//: [Previous](@previous)

import Foundation

//: [Next](@next)

//闭包 Sorted方法
let names = ["AT", "AE", "D", "S", "BE"]
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

//尾随闭包一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用

var reversed = names.sorted( by: { $0 > $1 } )
//$0和$1表示闭包中第一个和第二个String类型的参数。
//var reversed = names.sorted(by: >)简单地传递一个大于号
//Swift可以自动推断出您想使用大于号的字符串函数实现：
print(reversed)
//尾随闭包
//var reversed = names.sorted() {$0 > $1 }
//print(reversed)


let diginNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]
let numbers = [16, 58, 510]
//创建了一个整数数字到它们英文名字之间的映射字典，同时定义了一个将被转换成字符串的整数数组。
let strings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = diginNames[number % 10]! + output
        number = number / 10
    }while number > 0
    return output
}
//42行 string被推断为类型为[string]类型
//46行 利用余数运算符 ( number % 10 ) 计算了 number 的最后一位数字
// numbers的值是["OneSix", "FiveEight", "FiveOneZero"]


func makeIncrementer(forINcrement amount : Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
//内嵌函数
//func incrementer() -> Int {
//     runningTotal += amount
//     return runningTotal
//  }

