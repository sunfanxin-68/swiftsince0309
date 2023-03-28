//: [Previous](@previous)

import Foundation


/*
 为了模拟NSSortDescriptor的实现，我们得先从它的排序函数做起。简单来说，这就是一个接受两个同类型的参数，并且返回Bool的函数，我们可以用一个typealias来表示：
  */

typealias SortDescriptor<T> = (T, T) -> Bool
//T表示要排序的元素类型 让它等于一个函数，这个函数接受两个T类型的参数 布尔值表示比较的结果

let stringDescriptor: //类型是
SortDescriptor<String> = {  //等于一个 closure expression
    $0.localizedCompare($1) == .orderedAscending
}
//这样就定义了一个 按升序排序字符串的Descriptor

/*
 let lengthDescriptor: SortDescriptor<Episode> = {
    $0.length < $1.length
}
 但有时，我们实际上要比较的内容，不是T，而是T的某个属性，例如，我们要比较上一节中Episode的长度：
*/


func makeDescriptor<Key, Value>( //它是一个有两个泛型参数的 函数
    key: @escaping (Key) -> Value, //key表示排序属性的方式 接受key类型的参数返回一个value
    _ isAscending: @escaping (Value, Value) -> Bool //isAscending参数表示执行排序的方法
) -> SortDescriptor<Key> {

        return { isAscending(key($0), key($1)) }
}

func combine<T>(rules: [SortDescriptor<T>]) -> SortDescriptor<T> {
    return { l, r in
        for rule in rules {
            if rule(l, r) {
                return true
            }
            
            if rule(r, l) {
                return false
            }
        }
        
        return false
    }
}


