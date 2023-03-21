//: [Previous](@previous)

import Foundation

//除了Dictionary之外，Set是Swift标准库中，另外一个主要的无序集合（unordered collection）类型，包含一组不重复的值。
//你也可以把Set理解为一个只包含key而没有value的集合。本质上，Set也是一个哈希表，因此它有着和Dictionary诸多类似的地方。


var vowel: Set<Character> = ["a", "e", "i", "o", "u"]
// 无序集合 这是set和array最明显的一个区别
//由于初始化Set和Array的方式是一样的，因此，当我们要定义一个Set对象时，必须明确使用type annotation。Type inference会把这样的定义方式推导为一个Array。

vowel.contains("a")
// true contains判断它的参数是否在Set中，并返回一个bool值表示判断结果；
vowel.remove("a")   // a
//remove在Set中删除参数指定的元素，如果元素存在就成功删除并返回删除的元素，否则就返回nil；
vowel.insert("a") // (true, "a")
//insert在Set中插入参数指定的内容，如果插入的内容已存在，会返回一个值为(false,
//插入值)的tuple，否则，就返回(true, 插入值)；
vowel.insert("e") //插入值)的tuple，否则，就返回(true, 插入值)；
vowel.removeAll()   // Set([])
//removeAll则删除所有Set中的元素，留下一个空的集合
 
//遍历Set
//for循环

for character in vowel {
    print(character)
}

//是集合自身的forEach方法：
vowel.forEach { print($0) }

for character in vowel.sorted() {
    print(character)
}
// a, e, i, o, u
