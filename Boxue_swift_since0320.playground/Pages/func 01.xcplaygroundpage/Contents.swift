//: [Previous](@previous)

import Foundation

 func printName() {
     print("My name is Mars")
 }
/*
 func是定义函数的关键字，后面是函数名；
 ()中是可选的参数列表，既然是最简单的函数，自然我们可以让它留空；
 ()后面，是函数的返回值，同样，简单起见，我们也没有定义返回值；
 {}中是函数要封装的逻辑，其实，在这里，我们调用的print，
 也是一个函数，只不过，它是一个定义在标准库中的函数，并且带有一个参数罢了；
 */
printName()

func mul(m: Int, n: Int) {
    //在定义函数两个参数的时候使用，叫做argument name，
    print(m * n)
}

//我们通过下面这样来使用mul：
mul(m: 2, n: 3)
//一个用于在调用函数时使用，叫做argument label。

func mul(_ numbers: Int ...) {
    let arrayMul = numbers.reduce(1, *)//reduce：计算，可以对数组的元素进行计算。
    //返回使用给定闭包组合序列元素的结果。
    print("mul: \(arrayMul)")
}
mul(result: &result, 2, 3, 4, 5, 6, 7)
/*
 用numbers: Int...的形式，表示函数可以接受的Int参数的个数是可变的。
 实际上，numbers的类型，是一个Array<Int>，
 因此，为了计算乘积，我们直接使用Array类型的reduce方法就好了。
 reduce(_:_:)
 返回使用给定闭包组合序列元素的结果。
 */

func mul(result: inout Int, _ numbers: Int...) {
    result = numbers.reduce(1, *)
    print("mul: \(result)")
}
var result = 0
mul(result: &result,2,3,4,5,6,7)
result

/*
 通过函数返回内容
 当然，通过参数来获取返回值只能算函数的某种副作用，更“正统”的做法，
 应该是把返回值放在函数的定义里，像这样：*/
func mul(_ numbers: Int ...) -> Int {
//我们通过-> Type的方式，在参数列表后面定义返回值。然后，就可以用mul的返回值，来定义变量了：
    return numbers.reduce(1, *)
}

