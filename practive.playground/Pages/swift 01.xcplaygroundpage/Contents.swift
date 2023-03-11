//: [Previous](@previous)


var myVariable = 42  //使用 var 来声明变量
myVariable = 50
let myConstant = 42  //使用 let 来声明常量
//myConstant = 60  一个常量的值 只能为它赋值一次。
//这说明你可以用一个常量来命名一个值，一次赋值就可在多个地方使用。

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//练习  创建一个常量，显式指定类型为 Float 并指定初始值为 4。
let myVariable2: Float = 4

//值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。
let label = "The width is"
let width = 94
let widthLabel = label + String(width)


//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠（\
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//使用三个双引号（"""）来包含多行字符串内容。每行行首的缩进会被去除，只要和结尾引号的缩进相匹配。
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

//使用方括号 [] 来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号。
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var works = [
    "sato": "student",
    "tanaka": "designer",
]
works["morita"] = "cameraman"
shoppingList.append("blue paint")//数组添加元素
print(shoppingList)

//使用初始化语法来创建一个空数组或者空字典
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

/*使用 if 和 switch 来进行条件操作，使用 for-in、while 和 repeat-while 来进行循环。包裹条件和循环变量的括号可以省略，但是语句体的大括号是必须的。*/
let Scores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in Scores {
     if score > 50 {
         //score 遍历数组 teamScore +3 +1 +3 +3 +1 = 11
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//使用 if 和 let 一起来处理值缺失的情况
var optString: String? = "Hello"
//在类型后面加一个问号（?）来标记这个变量的值是可选的。
print(optString == nil)

var optName: String? = "ueda"
var greeting = "Hello!"
if let name = optName {
    greeting = "Hello, \(name)"
}



