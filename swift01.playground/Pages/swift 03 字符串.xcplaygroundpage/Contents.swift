//: [Previous](@previous)

import Foundation


//: [Next](@next)

//String值可以通过传入 Character值的字符串作为实际参数到它的初始化器来构造：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱️"]
let catString = String(catCharacters)
print(catString)
print(catCharacters)

//String值能够被加起来（或者说连接），使用加运算符（ +）来创建新的String值：
let string1 = "こんにちは！"
let string2 = "天気いいね"
var greeting = string1 + string2

//也可以使用加赋值符号（ +=）在已经存在的 String值末尾追加一个 String值：
var welcome = "散歩しましょう"
welcome += string2

//使用 String类型的 append()方法来可以给一个 String变量的末尾追加 Character值：
let mark = "!"
//let mark: Character = "!"
welcome.append(mark)

let badStart = """
one
two

"""
let end = """
three
four
"""
print(badStart + end)
//想让每一行都换行 那上一行的末尾空一行

//字符串插值 每一个你插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠前缀：
//     \(字符串)  ||  \(数据类型（字符串））
let multiplier = 3
let message = "\(multiplier) かける2.5は \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
//用#（）# 来创建一个包含在其它情况下会被当作字符串插值的字符
print(message)

//要在使用扩展分隔符的字符串中使用字符串插值，在反斜杠后使用匹配首尾井号数量的井号。
print(#"6かける7は\#(6 * 7)."#)
print("6かける7は\(6 * 7).")

//检查一个字符串是否拥有特定的字符串前缀或者后缀，调用字符串的 hasPrefix(_:)和 hasSuffix(_:)方法
let romeoAndJuliet = [
    "Act 1 Scene 1: secne 1",
    "Act 1 Scene 2: secne 2",
    "Act 1 Scene 3: secne 3 Capulet's mansion",
    "Act 1 Scene 4: secne 4 Capulet's mansion",
    "Act 1 Scene 5: secne 5 Capulet's mansion",
    "Act 2 Scene 1: secne 6 Capulet's mansion",
    "Act 2 Scene 2: secne 7",
    "Act 2 Scene 3: secne 8 cell",
    "Act 2 Scene 4: secne 9",
    "Act 2 Scene 5: secne 10 Capulet's mansion",
    "Act 2 Scene 6: secne 11 cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
//用 hasPrefix(_:)方法操作 romeoAndJuliet数组来计算第一场场景的数量：
        act1SceneCount += 1
    }
}

print("在 \(act1SceneCount) 场景在 Act 1里面")
 var act2Count = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 2") {
        //查找有几个前缀带 Act 2 的
        act2Count += 1
    }
}
print ("在\(act2Count)场景在 Act 2 里面")


//用 hasSuffix() 来 查找带什么后缀的元素
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("cell") {
        cellCount += 1
    }
}
print("有\(mansionCount)场mansion场景和有\(cellCount)场cell景")


