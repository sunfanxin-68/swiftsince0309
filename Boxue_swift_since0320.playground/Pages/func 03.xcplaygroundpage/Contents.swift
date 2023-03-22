//: [Previous](@previous)

import Foundation

func square(n: Int) -> Int {
    return n * n
}

//首先一个大括号 里面是 函数参数列表 -> Int 是函数的返回值 使用关键字 in 表示实现
let squareExpression = { (n: Int) -> Int in
    return n * n
    
}
square(n: 2)
squareExpression(2)

let numbers = [1, 2, 3, 4, 5]
numbers.map { $0 * $0 }
numbers.map(squareExpression)
print(numbers.sorted(by: >))
//这是因为，numbers.sorted(by:)的函数参数是这样的：(Int, Int) -> Bool，而Swift为Int类型定义的>操作符也正好和这个类型相同，这样，我们就可以直接把操作符传递给它，本质上，这和我们传递函数名是一样的。
 
  
//一个函数加上它捕获的变量一起，才算一个closure。
func makeCounter() -> () -> Int {
    var value = 0

    return {
        value += 1

        return value
    }
}
let counter1 = makeCounter()
let counter2 = makeCounter()
//此时，counter1和counter2就叫做closure，
//它们既有要执行的逻辑（把value加1），还带有其执行的上下文（捕获的value变量）。

(0...2).forEach { _ in print(counter1()) } // 1 2 3
(0...5).forEach { _ in print(counter2()) } // 1 2 3 4 5 6
/*
 尽管从makeCounter返回后，value已经离开了它的作用域，
 但我们多次调用counter1或counter2时，value的值还是各自进行了累加。
 这就说明，makeCounter返回的函数，捕获了makeCounter的内部变量value。
 */
