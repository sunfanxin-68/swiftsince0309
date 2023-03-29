//: [Previous](@previous)

import Foundation

let stringOnes: [String] = [ "1", "one"]
//当我们要把stringOnes转变成一个Int数组的时候：
let intOnes = stringOnes.map { Int($0)} //传递一个closure

//我们就会得到一个[Optional<Int>]，当我们遍历intOnes的时候，就可以看到这个结果：
// Optional<1>
// nil
intOnes.forEach { print($0)}

var i = intOnes.makeIterator()

while let i = i.next() { //while的方式遍历intOnes
    print(i)
}
/*
 intOnes中元素的类型又是Optional<Int>，因此intOnes的迭代器指向的结果就是一个Optional<Optional<Int>>。

 当intOnes中的元素不为nil时，通过while let得到的结果，就是我们看到的经过一层unwrapping之后的Optional(1)；
 当intOnes中的元素为nil时，我们可以看到while let的到的结果并不是Optional(nil)，而直接是nil；
 */


//用我们之前提到的for case来读取所有的非nil值：
for case let one? in intOnes {
    print(one) // 1
}

//或者统计所有的nil值：
for case nil in intOnes {
    print("nil値をゲット")
    
}
