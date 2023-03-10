//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//Assignment operator 赋值操作符　代入演算子
let a = 20
var b = 10
var c = 1.5
var d = 4.5
 
//Arithmetic operator  复合运算操作符  算術演算子
let sum = a + b
let sub = a - b
let mul = a * b
let div = a / b
let mod = a % b
//let cc = a % c Swift 3不再允许浮点数取模。例如：8 ％ 2.5这样的写法在Swift 3中将会报错
let cc = c.truncatingRemainder(dividingBy: d)
// 如果要对浮点数取模 使用 truncatingRemainder(截断余数）dividing（除法） 方法进行浮点数取余

//: #### Compound assignment 复合运算操作符 把赋值和算数运算符组合起来：
b += 10 // b = b + 10
b -= 10 // b = b - 10
b *= 10 // b = b * 10
b /= 10 // b = b / 10
b %= 10 // b = b % 10
//: #### Comparison 比较操作符
let isEqual     = sum == 10  //相等
let isNotEqual  = sum != 10  //不等
let isGreater   = sum >  10  //大于
let isLess      = sum <  10  //小于
let isGe        = sum >= 10  //大于等于
let isLe        = sum <= 10  //小于等于

//Swift还支持两个用于比较对象引用的操作符：Identity operator，它们用来判断两个操作数是否引用同一个对象
// Identity operator。恒等运算符

//===。返回一个布尔值，指示两个引用是否指向相同的对象实例。
//!==

//三元操作符
//if question {
//    answer1
//} else {
//    answer2
//}
let isSumEqualToTen = isEqual ? "Yes" : "No"  //isSumEqualToTen是否相等 是则yes。不是则no isEqale=sum为30 所以no

//Nil Coalescing Operator  Nil 无  Coalescing 合并
//opt != nil ? opt! * b //如果opt是一个optional，当其不为nil时，就使用optional变量自身的值，
//a != nil ? a! : b 如果 a 为非空值（non-nil），那么值 b 将不会被计算。这也就是所谓的短路求值。
//否则，就使用??后面的“默认值”。
let userInupt: String? = "A user input" //userInupt是不是string 是的话就是 "A user input"
userInupt ?? "A default input"   //不是string的话就是 "A default input"

let fruit = "apple"
var fruitName: String?  //默认为Nil 空
// fruitapple = fruit ?? fruitName//fruitName的值为空 所以fruitapple的值为apple

//Range operator 闭区间 表示一个范围
for index in 1..<3 {
    print(index)
}

let names = ["佐藤", "李さん", "森田", "大和田"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}


//Logic operator 返回一个Bool 布尔
let logicalNot = !isEqual //不等于
let logicalAnd = isNotEqual && isLess  //与
let logicalOR = isGreater || (isLess && isLe) //或
print(logicalNot)
print(logicalAnd)
print(logicalOR)

let yes = false
if !yes {    //如果不是yes 则打印
    print("it`s not yes")  //只有不是yes 或者 yes为falsede情况下才打印
}
