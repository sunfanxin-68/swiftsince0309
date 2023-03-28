//: [Previous](@previous)

import Foundation

let numbers:[Int] = []

if !numbers.isEmpty && numbers[0] > 0 {
//先判断这个数组是否为空 只有这个表达式为true是 这个程序才会继续判断后面的表达式
}

//当如果我们自己定义一个执行逻辑或运算的函数：
func logicAnd(_ l:Bool, _ r: @autoclosure() -> Bool) -> Bool { //表示 l 逻辑 r 的结果
//l 是左操作数 r是右操作数 类型是 布尔
    guard l else { return false }
//用guard 确定l 为 true 否则就return false
    
    return r() //如果l为true
}

logicAnd(!numbers.isEmpty, numbers[0] > 0)
//这样，我们就可以只写上用于得到返回值的表达式，Swift会自动把这个表达式变成一个closure：

/*
 logicAnd(!numbers.isEmpty, number[0] > 0)
 道理很简单，函数在执行前，要先评估它的所有参数，在评估到numbers[0]的时候，发生了运行时异常。此时，我们在logicAnd内部通过guard模拟的short circuit完全派不上用场。
 */
