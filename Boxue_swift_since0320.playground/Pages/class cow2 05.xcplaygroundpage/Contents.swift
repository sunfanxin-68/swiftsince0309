//: [Previous](@previous)

import Foundation

/*
 为了判断对象是否只有一个引用，我们可以调用Swift标准库中的isKnownUniquelyReferenced方法，它的用法是这样的：

 首先，对于Swift原生类对象，只有单一引用时返回true，否则返回false：
 */

class Demo1 {}

var nativeClassObj1 = Demo1()
isKnownUniquelyReferenced(&nativeClassObj1) // true

var nativeClassObj2 = nativeClassObj1 //这样Demo2 就有两个引用了
isKnownUniquelyReferenced(&nativeClassObj1) // false


var arrayObj: NSArray = [1, 2, 3]
isKnownUniquelyReferenced(&arrayObj) // false ？？
//对于Objective-C中的类对象，总是返回false：


final class Box<T> {
    var unbox: T
    
    init(_ unbox: T) {
        self.unbox = unbox
    }
}
var boxed = Box(arrayObj)
isKnownUniquelyReferenced(&boxed) // true


struct MyArray {
    var data: Box<NSMutableArray>

    init(data: NSMutableArray) {
        self.data = Box(data.mutableCopy() as! NSMutableArray)
    }
}
