//: [Previous](@previous)

import Foundation

//Array [1,2,3,3]  initialization
/*Array表示一组有序（ordered）的数据集合，所谓有序，并不是指大小排序，而是指Array中的元素有先后的位置关系，稍后我们会看到，这个位置关系可以用来访问Array中的元素。在此之前，先来看了解如何定义Array对象。*/
 
var array1: Array<Int> = Array<Int>()
var array2:[Int] = []
var array3 = array2

/*在上面的代码中，前两种使用了type annotation，Array<Int>和[Int]没有区别，你可以根据自己的喜好来选择。而第三种，我们直接使用了一个空的Array生成了一个新的Array对象。*/
var threeInts = [Int](repeating: 3, count: 3)
//参数 repeating 表示数组中元素的值 参数count 表示数组中元素的个数
var sixInts = threeInts + threeInts
// 可以把同类型的array相加从而得到新的array
var fiveInts = [1, 2, 3, 4, 5]
//初始化包含不同值的数组

//介绍常见的数组属性 Common attributes
fiveInts.count //表示数组中元素的值 17行 5
array1.isEmpty //一个布尔值 表示数组是否为空

//访问array元素的方法 Access element
fiveInts[2]
//fiveInts[5]  This will crash
//当使用索引访问数组元素时，你必须自行确保索引的安全性。如果索引超过了数组的范围，程序就会直接崩溃
 
fiveInts[0...2]
fiveInts[0..<2] //半闭半开区间
//次，是使用range operator访问数组的一个范围：
type(of:fiveInts[0..<2] )
//ArraySlice Array某一段内容的view，它不真正保存数组的内容，只保存这个view引用的数组的范围：
// +---------+---+
// | length  | 5 |
// +---------+---+
// | storage ptr |
// +---------+---+
//           |
//           v
//           +---+---+---+---+---+---------------------+
//           | 1 | 2 | 3 | 4 | 5 |  reserved capacity  |
//           +---+---+---+---+---+---------------------+
//           ^
//           |
// +---------+---+
// | storage ptr |
// +---------+---+
// | beg idx | 0 |
// +---------+---+
// | end idx | 3 |  ArraySlice for [0...2]
// +---------+---+
//可以直接通过这个view创建新的Array对象：
Array(fiveInts[0...2])


 
//Traverse for循环遍历

for value in fiveInts {
    print(value)
}
/*如果我们想在遍历的时候，同时获得数组的索引和值，
 可以使用数组对象的enumerated()方法，
 它会返回一个序列中的每个元素都是一个Tuple，也就是返回一个Sequence对象，
 包含了每个成员的索引和值，*/
fiveInts.enumerated()
for (index, value) in fiveInts.enumerated() {
    print("\(index): \(value)")
}

fiveInts.forEach { print($0) }
/*接受一个closure参数 表示要对数组每个元素进行操作 $0是closure 参数的简写
 表示数组中的每一个值
 */

//修改数组 Array modifiacation
array1.append(1)
//在数组的末尾   追加元素 可以使用append方法 传递要添加的值
array1 += [2, 3, 4]
//或者使用 += 向数组添加内容

array1.insert(0, at: array1.startIndex)//[0,array1.endIndex]
/*在数组中某个特定位置添加元素的话用insert方法 它的第一个参数表示要插入的值，第二个参数表示要插入的位置，这个位置必须是一个合法的范围，即0...array1.endIndex，如果超出这个范围，会直接引发运行时错误。
*/
array1.remove(at: 4)//显示被删除的元素
array1.removeLast() //删除数组中的最后一个元素，还可以使用removeLast()方法：
