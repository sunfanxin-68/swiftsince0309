//: [Previous](@previous)

import Foundation

for i in 1...10 where i % 2 == 0 { 
//用where 来进行更复杂的约束 比如只迭代range中的偶数
    print(i)
}

//先定义一个 enum Power 定义一个手机电量
enum Power {
    case fullyCharged
    case normal(percentage: Double)
    case outOfPower
}

let battery = Power.normal(percentage: 0.1)

switch battery {
case .normal(let percentage) where percentage <= 0.1:
    print("几乎没电了")
case .normal(let percentage) where percentage >= 0.8:
    print("差不多充满了")
    
case .fullyCharged, .outOfPower://用逗号分割多个要处理的情况
    print("充满了或者几乎没电")
default:
    print("正常电池状态")
}
 
if case .normal(let percentage) = battery, case 0...0.1 = percentage {
    print("電池切れそう　")
}
//用一个变量绑定它的关联值

//使用tuple简化多个条件的比较
let username = "11@boxue.io"
let password = 11111111

//当我们要同时比较这两个值时，最普通的写法，就是在if中使用逻辑与（&&）操作符：
if username == "11@boxue.io" && password == 11111111 {
    print("correct")
}

//如果你不喜欢在if中并列多个比较语句，我们还可以用case临时生成一个tuple，并且，让它和username / password进行比较：
if case ("11@boxue.io", 11111111) = (username, password) {
    print("correct")
}
