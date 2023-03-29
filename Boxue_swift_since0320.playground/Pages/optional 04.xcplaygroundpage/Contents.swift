//: [Previous](@previous)

import Foundation

func arrayProcess(array: [Int]) {
    guard let first = array.first else {
//使用guard let绑定了array.first的非nil值。
        return
    }

    print(first)
}
//我们就可以在else内部，统一处理array.first为nil的情况
//else的最后一行必须离开当前作用域，对于函数来说，就是从函数返回，或者调用fatalError表示一个运行时错误。


//在Swift里，有一类特殊的函数，它们返回Never，表示这类方法直到程序执行结束都不会返回。Swift管这种类型叫做uninhabited type。
// Swift 中，可以使用 Never 类型来表示 Uninhabited Type。Never 类型表示一个函数或表达式不会正常返回，因此它不可能有任何值，也不可能被实例化。

func toDo(item: String?) -> Never {
    guard let item = item else {
/*
 我们在返回Never的函数中，使用guard时，else语句并不需要离开当前作用域，而是最后一行必须调用另外一个返回Never的函数就好了
 */
        fatalError("何もしない")//使用fatalError返回一些用于排错的消息
    }
    
    fatalError("Implement \(item) later")
}

//一个伪装的optional

func arrayProcess(array: [Int]) -> String? {
    let firstNUmber: Int
    
    if let first = array.first {
//首先，我们使用了Swift中延迟初始化的方式，在if let中，才初始化常量firstNumber；
        firstNumber = first
    }else {
        return nil
    }
 /*
  从程序的执行路径分析，对于firstNumber来说，要不我们已经在if let中完成了初始化；要不，我们已经从else返回。因此，只要程序的执行逻辑来到了if...else...之后，访问firstNumber就一定是安全的了。
  */
    //firstNumber`可以在这里安全使用
    return String(firstNumber)
}
/*
 firstNumber就像一个伪装的optional一样，在if let分支里被初始化成具体的值，
 在else分支里，被认为值是nil。因此，在else代码块之后，就像在之前guard语句之后一样，我们也可以认为firstNumber一定是包含值的，因此安全的访问它。
 */
