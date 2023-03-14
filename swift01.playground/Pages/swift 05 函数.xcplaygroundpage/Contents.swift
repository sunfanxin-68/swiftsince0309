//: [Previous](@previous)

import Foundation

//: [Next](@next)

// 定义一个输入形式参数——一个叫做 person 的 String类型值
//使用一个 func的关键字前缀。你可以用一个返回箭头 -> (一个连字符后面跟一个向右的尖括号)来明确函数返回的类型。
func greet(person: String) -> String {  //函数返回String类型
    let greeting = "おはようございます," + person
    return greeting
}
print(greet(person: "ちあき"))
print(greet(person:"よしと"))

func sayhello() -> String {
    return "hello"
}
print(sayhello())

func greetAgain(person: String) -> String {
    return "また会えたね, " + person + "!"
}
print(greetAgain(person: "ウェイウェイ"))

//多形式参数的函数
func greet(person: String, alreadyGreeted :Bool)  -> String {
    //接收两个实际参数
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "コナンくん", alreadyGreeted: false))

//不需要返回值的函数
func greeting(person: String) {
    print("こんばんは, \(person)!")
}
greeting(person: "しんちゃん")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "今日天気いいね")
//返回了一个 Int类型的字符数统计 7个字符
printWithoutCounting(string: "散歩しましょう")

func minMax(array: [Int]) -> (min: Int, max: Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return(currentMin, currentMax)
}
let bounds = minMax(array: [-8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//任何只有一行 return 的函数都可以省略那个 return 。
func greetingfun(for person: String) -> String {
    "どうも、" + person
}
print(greetingfun(for: "minato"))

func anotherGreeting(for person: String) -> String {
    return "こんにちは、" + person
}
print(anotherGreeting(for: "naruto"))

//指定实际参数标签　实际参数标签的使用能够让函数的调用更加明确
//相当于 函数里用 字典 key:value
func greet(person: String, from hometown: String) -> String {
    return "初めまして \(person)!　君も\(hometown)来たからですか "
}
print(greet(person: "lock", from: "jiangsu"))

//默认形式参数值

func someFunction(parameterWithDefault: Int = 12) {
}
someFunction(parameterWithDefault: 6) // parameterWithDefault 变为 6
someFunction() // parameterWithDefault 还是 12



//当调用函数的时候你可以利用可变形式参数来声明形式参数可以被传入值的数量是可变的。
//可以通过在形式参数的类型名称后边插入三个点符号（ ...）来书写可变形式参数。
func arithmeticMean(_ numbers: Double...) -> Double {
    var total :Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)//全部相加等于 15 除以 5
arithmeticMean(3, 8.25, 18.75)

//使用函数类型
// (Int, Int) -> Int 有两个形式参数的函数类型，它们都是 Int类型，并且返回一个 Int类型的值
func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
    print("Result: \(mathFunction(2, 3))")
    
mathFunction = multiplyTwoInts
print("答えは\(multiplyTwoInts(4, 12))")
//定义一个叫做 mathFunction的变量，它的类型是‘一个能接受两个 Int值的函数，并返回一个 Int值。’将这个新的变量指向 addTwoInts函数。
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    //printMathResult(_:_:_:)的作用就是当调用一个相应类型的数学函数的时候打印出结果
    print("答えは\(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)

//定义了两个简单函数叫做 stepForward(_:)和 stepBackward(_:)。
//函数 stepForward(_:)返回一个大于输入值的值，而 stepBackward(_:)返回一个小于输入值的值
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepBackward
    //返回类型是“一个函数的类型 (Int) -> Int
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("0!")

//函数的内部定义另外一个函数。这就是内嵌函数。
func chooseStepFunction(backward:Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backward ? stepBackward : stepForward
}
var currentKey = -9
let MoveNearerToZero = chooseStepFunction(backward: currentKey > 0)
//MoveNearerToZero现在嵌套stepForward() 函数
while currentKey != 0 {
    print("\(currentKey)...")
    currentKey = MoveNearerToZero(currentKey)
}
print("0!!!!")

