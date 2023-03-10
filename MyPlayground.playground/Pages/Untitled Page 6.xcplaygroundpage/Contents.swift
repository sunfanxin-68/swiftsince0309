//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

struct IntArray {
    func listDemo(){}
    ///  使用多个单行注释看起来会整齐一些
    ///  对于一个函数来说，最重要的内容无非有以下
    ///  一句话功能描述
    /// 常见运用场景实例   下面代码要空一个 tab 才会被xcode识别
    ///
    ///        let numbers = [1, 2, 3, 4, 5]
    ///        print(numbers.dropLast(2))
    ///        // Prints "[1, 2, 3]"
    ///        print(numbers.dropLast(10))
    ///        // Prints "[]"
    ///
    /// - Parameter n:-通过callout 定义的参数和
    ///
    /// - Returns: 返回值
    /// - Complexity: 通过complexity 定义的算法复杂度
    ///
    ///就可以在quick help里看到我们编写的注释了
    func dropLast(_ n: Int) -> IntArray { return IntArray()}
    
    }

