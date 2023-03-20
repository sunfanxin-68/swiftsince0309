//: [Previous](@previous)

import Foundation

//Swift有一套自己的“现代化”手段。简单来说，就是用closure来参数化对数组的操作行为。

/*假设我们有一个简单的Fibonacci序列：[0, 1, 1, 2, 3, 5]。
 如果我们要计算每个元素的平方，怎么办呢？
 一个最朴素的做法是for循环：
 */
var fibonacci = [0, 1, 1, 2, 3, 5]
var squares = [Int]()

for value in fibonacci {
     squares.append(value * value)
}

let constSquares = fibonacci.map { $0 * $0 }
constSquares
/*
 map用于把数组中的元素进行某种变换后返回 有一个closurs参数用来写具体的变换行为
 map会把每一个元素的计算结果保存成一个新的数组 并且返回给map的调用者
 这样的代码不仅比普通的for循环更具有表现力 也解决了需要一个常量数组的问题
 */

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        /*由于并不知道要把数组元素转换成什么类型 因此要把mymap实现成一个泛型方法 <T>表示数组元素中转换后的类型 它有一个参数transfrom表示要对元素进行转换的方法
         */
        /*
         这个方法接受一个element类型的参数 并且返回 T
         其中 Element可以理解为 array中元素的类型，它是array定义的一部分
         最后返回 [T] 表示转换后的数组
         */
        var tmp: [T] = []
        tmp.reserveCapacity(count)

        for value in self { //用for循环遍历self的内容
            tmp.append(transform(value)) //对数组中每个值调用这个方法
            //把结果依次添加到temp
        }

        return tmp
    }
}
//let constSequence1 = fibonacci.myMap { $0 * $0 }
print(fibonacci.myMap { $0 * $0 })
/*
 仔细观察myMap的实现，就会发现它最大的意义，就是保留了遍历Array的过程，而把要执行的动作留给了myMap的调用者通过参数去定制。而这，就是我们一开始提到的用closure来参数化对数组的操作行为的含义。
*/

//首先，是找到最小、最大值，对于这类操作来说，只要数组中的元素实现了Equatable protocol，我们甚至无需定义对元素的具体操作：
fibonacci.min()
type(of: fibonacci.max())
/*
 使用min和max很安全，因为当数组为空时，这两个方法将返回nil。
 其次，过滤出满足特定条件的元素，我们只要通过参数指定筛选规则就好了：
 */

//其次，过滤出满足特定条件的元素，我们只要通过参数指定筛选规则就好了：
fibonacci.filter { $0 % 2 == 0 }

//第三，比较数组相等或以特定元素开始。
//对这类操作，我们需要提供两个内容，一个是要比较的数组，另一个则是比较的规则：

fibonacci.elementsEqual([0, 1, 2], by: { $0 == $1 })
// 使用elementsEqual方法 他有两个参数 第一个参数是要比较的数组
//如果数组中的元素默认不支持比较 可以使用第二个参数 by： 来手动 指定比较规则
//这里使用一个closures来比较两个元素是否相等

fibonacci.starts(with: [0, 1, 1], by: { $0 == $1 })
//用starts 方法来判定数组是否以特定的序列开头 第一个参数with：用来指定要判断的数组
 
fibonacci.forEach { print($0) }
//来表示单纯遍历数组的行为 用一个closures来表示我们对数组执行的每一个动作
//和map的区别 forEach并不处理closures 的返回值 因此只适用于对数组中的元素进行一些操作
//而不能用来操作返回结果

fibonacci.sorted(by: >)//用参数by 来指定 排序的规则 比如用一个 大于号来进行降序排列
// > 为 { $0 > $1 }的缩写
/*sorted(by:)的用法是很直接的，它默认采用升序排列。
 同时，也允许我们通过by自定义排序规则。在这里>是{ $0 > $1 }的简写形式。Swift中有很多在不影响语义的情况下的简写形式。
 */

let pivot = fibonacci.partition(by: { $0 < 1 })
fibonacci[0 ..< pivot] // [5, 1，1，2, 3]
//表示数组中不满足条件的部分

pivot
fibonacci[pivot ..< fibonacci.endIndex] // 则表示满足条件的部分

/*
 是把数组的所有内容，“合并”成某种形式的值，对这类操作，我们需要指定的，是合并前的初始值，以及“合并”的规则。例如，我们计算fibonacci中所有元素的和：
 */
fibonacci.reduce(0, + )
//在这里，第一个参数表示合并前的初始值是0，和第二个参数表示合并的动作 +，则是{ $0 + $1 }的缩写。


/*
 在clousers参数中访问外部变量的问题
 由于clousers可以捕获相同作用域内的变量
 */
extension Array {
    //定义一个用于累加数组元素的方法 定义为一个<T>泛型函数
    func accumulate<T>(_ initial: T, _ nextAccumulate: (T, Element) -> T)
    -> [T] {
   //有两个参数 第一个initial 表示累加前的初始值，类型是 T
//第二个参数 nextAccumulate 表示执行下一次累加的方法 这个方法要接受两个参数
//第一个参数是 T 表示上一次累加的结果，第二个是Element 表示数组中下一个要累加进来的元素
//然后返回T 表示一次累加后的值 最终让 accumulate 返回 array T 表示所有元素位置累加的结果
        var sum = initial
//先定义一个外部变量表示初始值
        return map {
            sum = nextAccumulate(sum, $0)
    //先用nextAccumulate的返回值 更新sum，这样每次调用map
//sum的值都会更新成当前数组中的值和之前所有元素的累加和
        return sum
            //这样 所有的和就写进去了新的数组
        }
    }
}
fibonacci.accumulate(0, +)
