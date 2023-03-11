//: [Previous](@previous)

import UIKit



extension String: Collection {
    
}
var swift = " Swift is fun"
swift.dropFirst(9) //删掉前9个元素

let group = "👨‍👩‍👧‍👦"
group.dropFirst()//删掉一个元素 按道理出现一个三人emoji

let cafee = "caf\u{0065}\u{0301}"
cafee.dropFirst(4)
cafee.dropFirst(3)//从前往后删掉3个字符
cafee.dropLast(1) //从后往前删掉一个字符 按道理是报错

cafee.unicodeScalars.forEach { print($0) }
//按照字符串中每一个字符的unicode scalar来形成集合 标量表示法
cafee.utf8.forEach { print($0) }
cafee.utf16.forEach { print($0) }

cafee.unicodeScalars.dropLast()
cafee.utf16.dropLast()
cafee.utf8.dropLast()

//cafee.characters // String.CharacterView
cafee.count

//String.Character.Index
cafee.startIndex
cafee.endIndex

//1.获得特定位置的字符 get character Index
let index = cafee.index(cafee.startIndex, offsetBy: 3)
//offsetBy 返回一个索引，该索引是距给定索引的指定距离。
let index2 = cafee.index(
    cafee.startIndex,
    offsetBy: 5,
    limitedBy:  cafee.endIndex)
//limitedBy 除非该距离超出给定的限制索引。
let index3 = cafee.index(cafee.startIndex, offsetBy: 0)
// 2.Subscript access
cafee[index]
cafee[index3]

let index4 = cafee.index(
    cafee.startIndex,
    offsetBy: 100,
    limitedBy: cafee.endIndex) // nil
/*如果担心offsetBy参数越界，还可以使用
index(_:offsetBy:limitedBy:)方法添加一个末尾位置的限制
，一旦offset越界，这个方法就会返回nil：*/

extension String {
    subscript(index: Int) -> Character {
        guard let index = self.index(startIndex,
        offsetBy: index,limitedBy: endIndex) else {
        fatalError("String index out of range.")
            
        }
        return self[index]
    }
}
cafee[3]
