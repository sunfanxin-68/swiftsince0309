//: [Previous](@previous)

import Foundation
var a = [1, 2, 3]
let copyA = a
/*在Swift中，Array是按照值语义实现的，当我们复制一个Array对象时，会拷贝整个Array的内容：
 */
a.append(4)
/*  复制a并向a添加内容之后，copyA 的内容并不会被修改
 array 在swift里是一个值类型
 但是，Swift在复制Array时，同样对Array的性能有所考量，它使用了copy on write的方式。即如果你仅仅复制了Array而不对它修改时，真正的复制是不会发生的，两个数组仍旧引用同一个内存地址。只有当你修改了其中一个Array的内容时，才会真正让两个Array对象分开。
 */

func getBufferAddress<T> (of array: [T] ) -> String {
    return array.withUnsafeBufferPointer {
        buffer in return String(describing: buffer.baseAddress)
    }
}
 /* 由于array是一个泛型类型 我们需要把 getBufferAddress也定义为一个泛型函数
  用《T》来表示数组中元素的类型 T有一个参数 array： 来表示获取地址的数组
  用[T]来表示类型 并返回String来表示数组的地址
  返回 array.withUnsafeBufferPointer 这个方法接受一个Closures 参数
  会把array的地址 传递给 closures
  所以在16行它的closures实现里 直接用地址参数 生成一个String
  */

getBufferAddress(of: a)
getBufferAddress(of: copyA)

a.append(4)

getBufferAddress(of: a)
getBufferAddress(of: copyA) //copy on write 的效果
/* 把修改a的语句 放到 实现后面来
 
 只有在给a添加内容后，它才被重新分配了内存地址。
 */
//copyA.append(4)
/* Array数组是否可以被修改 是通过 var let 关键字来确定 array自身并不可以
 */
 
 //NsArray
 
/*
 在Foundation中，数组这个类型有两点和Swift Array是不同的：
 数组是否可以被修改是通过NSArray和NSMutableArray这两个类型来决定的；
 NSArray和NSMutableArray都是类对象，复制它们执行的是引用语义；
 */
let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
let deepCopyB = b.copy() as! NSArray //这是一个 API

b.insert(0, at: 0)
 copyB
deepCopyB

/*尽管我们在创建copyB时，使用了NSArray，表明我们不希望它的值被修改，由于这个赋值执行的是引用拷贝，因此，实际上它和b指向的是同一块内存空间。因此，当我们修改b的内容时，copyB也就间接受到了影响。*/
