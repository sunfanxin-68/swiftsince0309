//: [Previous](@previous)

import Foundation
//: [Next](@next)

//如果变量的可选值是 nil，条件会判断为 false
//如果不是 nil，会将值解包并赋给 let 后面的常量，这样代码块中就可以使用这个值了。
let nickName: String? = nil
let fullName: String = "LI noeul"
let informalGreeting = "Hello \(nickName ?? fullName)"
//另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。

let vegetable = "black pepper"
switch vegetable {
case "celery" :
    print("セロリと牛肉炒めは美味しい")
case "パクチー","ねぎ":
    print("パクチー鍋食べたい")
case let x where x.hasSuffix("pepper"):
    //如果变量x后缀有 pepper的话
    print("Is it a spicy \(x)?")
default:
    print("スープの中何入れても美味しい")
    
}
/*运行 switch 中匹配到的 case 语句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾写 break

可以使用 for-in来遍历字典，需要一对儿变量来表示每个键值对。
 字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束。*/
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            
        }
    }
}
print(largest)

var welcomeMessage: String
//声明一个叫做 welcomMessage 的变量，他的类型是 String
welcomeMessage = "おはよう"

var red, blue,person: Double
red = 1.1
person = 2.2
/*你可以在一行中定义多个相关的变量为相同的类型，用逗号分隔，只要在最后的变量名字后边加上类型标注。*/

let price = 5 + 2.5
//会被swift推断是double 浮点类型的变量

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
/*一个常量是utn16一个是utn8
这里让 UInt16 (one ) 创建一个新的 UInt16 类型并用 one 的值初始化，
加号两边的类型现在都是  UInt16 ，所以现在是可以相加的*/

let three = 3
let pointone = 0.1415
let pi = Double(three) + pointone
//常量 three 的值被用来创建一个类型为 Double 的新的值
let integerpi = Int(pi)
/*在用浮点数初始化一个新的整数类型的时候，数值会被截断。也就是说 4.75 会变成 4 ， -3.9 会变为 -3 。*/

//let (statusCode, statusMessage) = 404,Error
//print("The status code is \(statusCode)")

let http404Error = (404, "見つからないよ")
//定义一个一个类型为 (Int, String)  的元组
let (statusCode, statusMessage) = http404Error
//将一个元组的内容分解成单独的常量或变量
print("The エラーコード　is \(statusCode)")
print("The エラーメッセージ is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
//不需要的数据可以用下滑线（ _ ）代替：
print("ただ一部のデータコード is \(justTheStatusCode)")

//从零开始的索引数字访问元组中的单独元素
print("索引数组第一个 is \(http404Error.0)")
print("索引数组第二个 is \(http404Error.1)")

//可以在定义元组的时候给其中的单个元素命名：
let student = (name: "sato", age: 19)
print("僕の名前は\(student.name),今年は\(student.age)歳になりました")
//过访问名字来获取元素的值

let possibleNumber = "123456789"
let convertedNumber = Int(possibleNumber)
//print (convertedNumber) 会返回一个可选的 Int ，而不是 Int 。

var numbernil:Int? = 4044
numbernil = nil
//可以通过给可选变量赋值一个 nil 来将之设置为没有值
var no : String?
//如果你定义的可选变量没有提供一个默认值，变量会被自动设置成 nil 。

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {  //如果变量不等于nil 就输出下列语句
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
//if let constantName = someOptional {
//    statements
//}

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

let myNumber = Int(possibleNumber)
// 让mynumber等于整数的possibleNumber 123456789
if let myNumber = myNumber {
    //代码在查看myNumber是否有值 如果 myNumber 有值，那新常量 myNumber 就会设置为那个值
    print("My number is \(myNumber)")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"),
   firstNumber < secondNumber && secondNumber < 100 {
    ////可以在同一个 if 语句中包含多可选项绑定，用逗号分隔
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 50 {
            //如果第一个数小于 第二个数字并且第二个数字小于100的话，则打印下列语句
            print("\(firstNumber) < \(secondNumber) < 50")
        }
    }
}

if convertedNumber != nil {
    print("convertedNumber 里头有一个整数值名为 \(convertedNumber!).")
}
/*强制展开一旦你确定可选中包含值，
 你可以在可选的名字后面加一个感叹号 （ ! ） 来获取值，
 感叹号的意思就是说“我知道这个可选项里边有值，展开吧。”这就是所谓的可选值的强制展开*/

//可选项展开
let possibleString: String? = "一个可选展开字符串An optional string."
let forcedString: String = possibleString!
//需要一个感叹号

//隐式可选项展开
let assumedString: String! = "一个隐式可选项展开字符串An implicitly unwrapped optional string."
let implicitString: String = assumedString
// 不需要感叹号
//如果在隐式展开可选项没有值的时候还尝试获取值，会导致运行错误。结果和在没有值的普通可选项后面加一个叹号一样。

let a = 40
let b = true
//let b = false
let c = a + (b ? 50 : 20)
// 如果b是true 则 c= a + b =  40+50 如果false就是 40 + 20 =60

//a != nil ? a! : b
//如果可选项 a  有值则展开，如果没有值，是 nil  ，则返回默认值 b 。
//如果 a 的值是非空的， b  的值将不会被考虑

let defaultColorName = "red"
var userDefinedColorName: String? // 默认是 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//因为“userDefinedColorName”是空值 所以 colorNameToUse 为 red（defaultColorName ）的值

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//给 userDefinedColorName  指定一个非空的值然后让合并空值运算符在检查一次，那么 userDefinedColorName  中封装的值将会替换掉给 （userDefinedColorName）前面的变量

for index in 1...5 {
    print("\(index) 回は　\(index + 5)")
}
//遍历 1到5 所有数字

let names = ["morita", "ueda", "mochituki", "kanou","tanaka"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) の名前は \(names[i])")
}
//打印单侧区间 数组索引号2开始到最后的元素
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    //打印数组中索引号0到2位置的元素一共三个
    print(name)
}

let range = ...5
range.contains(7)   // false 超过范围了
range.contains(5)   // true
range.contains(-1000)  // true 小于5的都是true


