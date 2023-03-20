import UIKit

var a = [1, 2, 3]
type(of: a[1]) // Int.type
/*a[1]的类型是Int，而不是Optional<Int>，
 这说明什么呢？你必须小心翼翼的使用index来访问Array中的元素，
 一旦index的值不正确，你就需要承担运行崩溃的严重后果。*/

//当我们想访问数组中的每一个元素时：
a.forEach { print($0) }  //接上一个closures 表示我们要对数组进行的操作
// or
/*
 想同时访问数组中的索引和值时 用for in （一个tuple）
 for（index; value;) in a.enumerated() {
    
}
*/

//当想要查找数组中元素的位置时 可以使用数组的index方法
//括号里有一个closuers参数 用来设置查找的条件
let oneIndex = a.firstIndex { $0 == 1 }//查找值为1 的元素的位置
oneIndex
//index会返回一个Optional<Int>，当要查找的元素存在时，就返回该元素的索引，否则，就返回nil

//当要筛选数组中某些元素时 用 filter（） 方法 同样带着一个closure参数
//用于设置筛选的条件
print(a.filter{ $0 % 2 == 0}) //例如筛选出所有的偶数


a.first //访问数组第一个 first属性
type(of: a.last)//访问数组最后一个 last 属性
/*
 swift都使用 optional 封装了他们
 当访问一个空数组的属性是 返回的就是nil
 
 */
type(of: a.removeLast())
type(of: a.popLast())
/*removeLast，你需要自行确保数组中有元素，否则会引发运行时错误；
 popLast，如果数组为空，会返回nil；
 当你基于Array实现诸如栈这样后入先出的数据结构时，弹出一个元素并判断是否为空是一个常规的操作，所以popLast返回了一个optional。而对于更一般的“删除数组中最后一个元素”这样的行为，Swift认为，这没有任何更具体的使用场景，你应该自己对这样的“低级操作”负责。

 Optional,是”不存在“或“空”概念的加强版本。而nil则是“不存在”的基础版本
 在swift中引入optional的目的，就是将"不存在"这个概念绑定到具体的类型上。optional.nil指向的是值的“不存在”，同时表示：如有值只能是optional.some<T>中的T类型，将所有类型的值空间进行了nil的扩展。

 */
