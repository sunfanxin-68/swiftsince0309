//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//每一个Tuple的类型，都是由Tuple中所有数据成员一起决定给的。

let success = (200, "Http ok")  //Tuple的类型 (Int, String)
let fileNotFound = (404,"File not Found")

//当我们需要用type annotation定义一个Tuple的时候，我们可以这样写：
let redirect : (Int,String) = (302, "Temporary redirect")
//redirect是变量名 "Temporary redirect"是一个字符串
//类型注释（type annotation）
//当你声明常量或者变量的时候可以加上类型标注
//（type annotation），说明常量或者变量中要存储的值的类型。
//如果要添加类型标注，需要在常量或者变量名后面加上一个冒号和空格，然后加上类型名称
var ten: Int = 10 //声明一个为Int类型的变量ten并赋值为10
var name : String = "タクヤ" ////声明一个为String类型的变量name并赋值为" タクヤ "

let kimura = ("イケメン", "アイドル")

success.0
success.1

fileNotFound.0
fileNotFound.1
kimura.0
kimura.1

let me = (name: "Mars",no: 11, email: "11@boxue.io") //Tuple类型 (String, Int, String)
me.name
me.no
me.email
//Tuple decomposition 我们在定义Tuple的时候，还可以把一个Tuple的值，一一对应的拆分到不同的变量上，

var (successCode,successMessage) = success 
successCode = 201
successMessage = "Http not ok"
print(successCode)
print(successMessage)
//可以这样定义一个新的Tuple
//我们这里是使用success的值，构建了一个新的Tuple，因此修改succeCode或successMessage的值，不会影响到原来的success

print(success) //从结果我们可以看到，之前的success的值没有被修改。

let (_, errorMessage) = fileNotFound //404被忽略了
//如果我们只是想对应到Tuple中特定的成员，而忽略其它成员，我们可以使用下划线'_'来代表那些不需要被对应的成员
print(errorMessage)

let tuple12 = (1, 2)
let tuple123 = (1, 2, 3)
//只有元素个数相同的Tuple变量之间，才能进行比较。
//tuple2 < tuple3  会引发编译错误

let tuple1 = (2, 5)
let tuple2 = (2, 6)

tuple1 < tuple2 // true
//如果Tuple中，相同位置的两个元素相等，则继续比较下一个位置的两个元素，
//并根据第一个同一位置不相等的两个元素的大小关系，确定两个Tuple变量的关系；
let tuple3 = (5, 5)
let tuple4 = (5, 5)

 tuple3 == tuple4 
//如果两个Tuple中所有位置的元素都相等，则两个Tuple变量相等；
