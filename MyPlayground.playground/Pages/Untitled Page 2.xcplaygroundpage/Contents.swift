//: [Previous](@previous)

import Foundation

var greeting = "Hello,yosito"

//: [Next](@next)
//Integer : 1 / 10 / 100 / 1000 数字分为两大类 整数类

//Double : 3.14 / 2.71  浮点类

//用Int来定义 有符号整数
//用UInt 来定义没符号整数

Int.min
Int.max

let fifteenInDecimal = 15
let fifteenInHex = 0xF   //16进制
let fiftenInOctal = 0o17 //八进制
let fifteenInBinary = 0b1111 //二进制
//可用多种方式表达一个整数 10进制 16进制 8 进制 2进制

let million = 1_000_000 //使用下划线来，分隔符来表示多个千分位
//尽可能用Int来表示整数

 // 1/3
var oneThirdInFloat : Float = 1/3  //Float: 最多表达6位精度的浮点数；
var oneThirdInDouble : Double = 1/3  //Double: 至少可以表达15位精度的浮点数；

print(oneThirdInFloat)
print(oneThirdInDouble)

var PI = 314e-2  //可以使用科学计数法。例如，表示浮点数PI：

var six = 6
type(of: six) // Int.Type
//使用一个整数，编译器会把它推导成Int

var zeroPointsixteen = 0.16
type(of: zeroPointsixteen) // Double.Type
//使用一个浮点数，编译器会把它推导成 Double

PI = 3 + 0.14
type(of: PI)  //double.type

//PI = three + zeroPointsixteen //不同变量不能直接相加
PI = Double(six) + zeroPointsixteen
//Double(Value)把一个Int类型的six，"转换"成了浮点数。
//用six的值，初始化了一个新的值为6的Double，并用这个新的Double和zeroPointForteen相加
