//: [Previous](@previous)

import Foundation


func mul(m: Int, n: Int) -> Int {
    return m * n
}

func div(a: Int, b: Int) -> Int {
    return  a / b
}

//calc有一个泛型参数 T，表示参与计算的类型
//它的前两个参数 first和second 表示参与计算的类型的值
//第三个参数 fn 是接受两个T类型参数 并返回 T的 函数 表示执行的计算
//最后让calc 也返回 T 表示计算的结果

func calc<T>(_ first: T, _ second: T, _ fn: (T, T) -> T ) -> T {
    return fn(first, second)////在他的实现里 我们调用fn， 把first和second传递给他
}
calc(2, 3, mul) //先传递2， 3 表示要操作的数。再传递一个和fn相同规格的函数，表示要执行的计算
calc(2, 3, div)//或者来计算商

//重载一个mul 只有一个int参数 让它返回一个 接受int参数 并返回int的函数
func mul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int { //在实现里 定义一个内嵌函数
        return a * b
    }
    return innerMul
}

//通过两种方式来调用mul 第一个把mul的返回值保存在一个变量里
 let mul2By = mul(2)
mul2By(3)
mul(2)(3) //也可以直接串联它的内嵌函数参数
