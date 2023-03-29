//: [Previous](@previous)

import Foundation
import Cocoa

let number: Int? = 1


//当optional不等于nil时，则执行某些操作
if number != nil {
    print(number!)//force unwrapping
}
//如果optional的值为nil就会触发运行时错误。所以，通常，我们会事先判断optional的值是否为nil。


if let number = number, number % 2 != 0 {
//number % 2 != 0中的number，指的是在if代码块中新定义的变量
    print(number)
}


//let imageUrl = " "
//if let url = URL(String: imageUrl), url.pathExtension == "jpg",
//   let data = try? Data(contentsOf: url),
//   let image = UIImage(data: data) {
//
//    let view = UIImageView(image: image)
//}
/*
 从生成URL对象，到根据url创建Data，到用data创建一个UIImage，每一步的继续都依赖于前一步的成功，而每一步调用的方法又都返回一个optional，因此，通过串联多个if let，我们就把每一步成功的结果绑定在了一个新的变量上并传递给下一步，这样，比我们在每一步不断的去判断optional是否为nil简单多了。
 */



let numbers = [1, 2, 3, 4, 5, 6]
var iterator = numbers.makeIterator()//用于遍历array的迭代器
while let element = iterator.next() { //iterator.next()会返回一个Optional<Int>，
   // 直到数组的最后一个元素遍历完之后，会返回nil。
//然后，我们用while let绑定了数组中的每一个值，并把它们打印在了控制台上。
    print(element)
}

for element in numbers {
    print(element)
}
/*
 在Swift里，for...in循环是通过while模拟出来的，
 这也就意味着，for循环中的循环变量在每次迭代的时候
 都是一个全新的对象，而不是对上一个循环变量的修改：
 */

var fnArray: [() -> ()] = []

for i in 0...2 {
    fnArray.append({ print(i)})
}
fnArray[0]()
fnArray[1]()
fnArray[2]()
/*
 由于变量i在每次循环都是一个新绑定的结果，因此，每一次添加到fnArray中的closure捕获到的变量都是不同的对象。当我们分别调用它们的时候，就可以得到捕获到它们的时候，各自的值了。
 */
