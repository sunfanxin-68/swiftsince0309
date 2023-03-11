//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let cafee = "caf\u{0065}\u{0301}"

let beg = cafee.startIndex //0 索引的第一个字符
let end = cafee.index(beg, offsetBy: 3) //3 把索引号移到第三位
let end2 = cafee.index(beg, offsetBy: 4) //3 把索引号移到第三位
cafee[beg ..< end] // 第一个到第三个字符出现 caf
cafee[beg ..< end2] //第一个到第4个字符出现 cafe

String(cafee.prefix(3)) //省略了 characters
//Swift提供了一个叫做prefix(_:)的方法，它返回一个特定的CharacterView

//遍历字符串中的每一个字符
//enumerated()方法是一种遍历集合的方法，它会将每一个元素的下标和值都传递给遍历的闭包。
var mixStr = "123 swiftはおもしろ"
for (index, value) in mixStr.enumerated(){ //enumerated方法会返回一个Tuple序列
    print("\(index) \(value)")
}

//首先找到插入内容的位置  of：参数 表示获取位置的字符
if let index = mixStr.firstIndex(of:"は") {
    mixStr.insert(contentsOf: " 5.0", at: index)
    //用insert（）方法 第一个参数 contentsOf: 表示要插入的内容 插入了“5.0”
    //第二个参数 at: 表示插入内容的位置 传递index
    
}
//基于Range的查找和替换 将日文字符改为中文字符
//Use 'firstIndex(of:)' instead
if  let jpIndex = mixStr.firstIndex(of: "は"){
    mixStr.replaceSubrange(jpIndex ..< mixStr.endIndex, with: " 456!")
}
  //我们要截取mixStr中的“有趣”部分，可以这样：
String(mixStr.suffix(5).dropLast())//dropLast 截掉末尾开始数n个字符
//String(mixStr.suffix(8))//从后往前第8位开始截断
//String(mixStr.suffix(3))//从后往前第3位开始截断
//先用suffix(后缀) 方法截掉了头部的"Swift 5.0 は"，


//用一个closure来指定分割条件。例如，把mixStr中的每个奇数位置的字符当成分隔符：
let strViews = mixStr.split(separator: " ") //以空格为标志 分割成多部分
strViews.map(String.init)

var i = 0
mixStr.split { _ in  //有一个参数 表示str中每一个字符
    if i > 0{
        i = 0
        return true//表示把当前字符 作为分隔符来处理
    }
    else {
        i += 1
        return false
        
    }
}
strViews.map(String.init)
