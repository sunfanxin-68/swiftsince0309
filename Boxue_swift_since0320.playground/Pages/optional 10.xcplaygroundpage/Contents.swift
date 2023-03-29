//: [Previous](@previous)

import Foundation

/*
 用!来定义一个implicitly unwrapped optional：
 */

var eleven: Int! = 11

//然后，我们就可以像访问一个普通Int一样访问eleven，而无需强行使用!来读取它的值：
if eleven == 11 {
    print(eleven)
}

/*
 在Swift 3里，implicitly unwrapped optional直接出场的机会已经非常少了。
 简单来说，主要有两个场景：
 1.用来传承Objective-C中对象指针的语义；
 2.用来定义那些初始为nil，但一定会经过既定流程之后，就再也不会为nil的变量；
 */

let image = UIImage(named: "someImage")

//implicitly unwrapped optional就派上用场了。
//对于明知一定会成功的调用，我们就可以用这种optional来直接获取API返回的对象：

let image: UIImage! = UIImage()

//然后，我们就可以像使用普通的UIImage一样来访问它的属性了：

image.backgroundColor
