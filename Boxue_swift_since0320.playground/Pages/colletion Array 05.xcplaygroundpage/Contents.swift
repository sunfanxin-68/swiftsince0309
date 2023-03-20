//: [Previous](@previous)

import Foundation

var fibonacci = [0, 1, 1, 2, 3, 5]

// [0, 2]
fibonacci.filter { $0 % 2 == 0 }
//filter 方法 用于在Array中，过滤满足特定条件的元素。
//而这个条件，就是通过filter的closure参数来确定的：
extension Array {
    func myFilter(_ predicate: (Element) -> Bool) -> [Element] {
//参数predicate 用来设定筛选的条件 这个条件用来接受一个element类型的参数返回一个布尔值
//最后让 myFiliter返回一个新的Element类型的数组
        var tmp: [Element] = []
 //定义一个空的 element数组 用来存放筛选后的结果
        
        for value in self where predicate(value) {
//再通过一个for循环来遍历数组中的每一个元素 给self添加一个限制 就是predicate(value)
//的值必须为 true
            tmp.append(value)
//对于array中这样的元素 直接添加到temp数组里
        }
        return tmp
    }
    //一个从数组中删除满足特定条件的方法
    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }
        //把调用转发给filter 然后对predicate的筛选结果取反
    }
    //判断数组中 是否所有元素都满足特定条件
    func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !contains { !predicate($0)  }//判断不存在 不满足数组的元素
    }
    
    func myReduce<T>(_ initial: T, _ next: (T, Element) -> T ) -> T {
        var tmp = initial
        
        for value in self {
           tmp = next(tmp, value)
        }
        return tmp
    }
    func myFilter2(_ predicate: (Element) -> Bool) -> [Element] {
        return reduce([], { predicate($1) ? $0 + [$1] : $0 })
        //空数组表示筛选结果的初始值 第二个参数是筛选规则
    }
    
    func myMap2<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([], { $0 + [transform($1)] }) // 0(n^2)
//在转换函数里 不断把转换完成的值 封装成一个数组 并把之前转换的结果拼接起来
//这样当所有元素都转换完成之后 reduce返回的就是map的结果了
        
    }
    
    func myFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var tmp: [T] = []
        
        for value in self {
            tmp.append(contentsOf: transform(value))
            //用contentsOf方法 把数组的值添加到了tmp里
        }
        return tmp
    }
    
    
    
}
print(fibonacci.myMap2{ $0 * $0})
print(fibonacci.myFilter2{ $0 % 2 == 0})



[2, 4, 6, 8].allMatch { $0 % 2 == 0 }
fibonacci.myReduce(0, +)
fibonacci.myReduce("") { $0 + "\($1)"}//合并的规则 把数组里的元素陆续拼接在字符串里

print(fibonacci.myFilter { $0 % 2 == 0 }.count > 0)
print(fibonacci.contains { $0 % 2 == 0})//contains判断是否满足特定条件的元素
print(fibonacci.reject { $0 % 2 == 0 })


let animals = ["🐱", "🐶", "🐰", "🐼"]
let ids = [1, 2, 3, 4]

print(animals.myFlatMap { animal in
    return  ids.map { id in(animal, id)}
})
