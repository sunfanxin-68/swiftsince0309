//: [Previous](@previous)

import Foundation

var light = "red"
var action = ""

if light == "red" {
    action = "stop"
}
else if light == "yellow" {
    action = "caution"
}
else if light == "green" {
    action = "go"
}
else {
    action = "invalid"
}


switch light {
    case "red":
        action = "stop"
    case "yellow":
        action = "caution"
    case "green":
        action = "go"
    default:
        action = "invalid"
    break
}
/*
 case语句必须exhausitive，也就是说，必须覆盖switch后面出现的表达式的所有情况，否则会导致编译错误。例如，我们去掉default，就会得到下面的错误：
 因此，当你不需要对列出case的其他情况作出处理时，你也要在default分支写上一句break，明确表示你考虑到了其他的情况，只是你不需要更多额外处理而已。
 
 其次，每个case语句不会自动“贯通”到下一个case，因此我们也无需在每个case最后一行写break表示结束；*/


let vowel = ["a", "e", "i", "o", "u"]

for char in vowel {
    print(char)
}
// aeiou

for number in 1...10 {
    if number % 2 != 0 { continue }
    if number > 8 {break}
    print(number)
}
l


// while

var i  = 0
while i < 10 {
    print(i)
    i += 1
}

// do ... while
repeat {
    print(i)
    i -= 1
} while i > 0

//在这两类循环里，我们都可以用continue来停止执行当前循环中的语句，立即开始下一次循环。例如，打印所有的偶数：
