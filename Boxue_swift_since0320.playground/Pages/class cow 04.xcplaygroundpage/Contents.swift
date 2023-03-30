//: [Previous](@previous)

import Foundation

let numbers1 = [1, 2, 3, 4, 5, 6]
var numbers2 = numbers1
//由于Array实现了COW机制，numbers1和numbers2会指向系统堆中的同一个位置。直到我们修改了其中的一个对象


numbers2[0] = 11

print(MemoryLayout.size(ofValue: numbers1)) //8
//这段代码的返回的结果是8，也就是一个64位内存地址占用的空间，事实上，无论数组里存放多少元素，一个Array对象的大小都是一个内存地址的大小。


//为了让所有的MyArray对象共享存储元素的空间，我们让它包含一个NSMutableArray对象：
struct MyArray {
    var data: NSMutableArray

    init(data: NSMutableArray) {
        self.data = data.mutableCopy() as! NSMutableArray
    }
}


