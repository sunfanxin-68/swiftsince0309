//: [Previous](@previous)

import Foundation

//当我们用一个class类型来实现callback时，要在实现callback的closure中，使用capture list：

let fav = FinishAlertView()
let countter = PressCounter()

fav.buttonPressed = { [weak counter] index in
    counter?.buttonPressed(at: index)
}

let numbers = [1, 2, 3]
numbers.map { number in number * 2}


/*
 在Swift里，这两种closure分别叫做escaping closure和non escaping closure。对于后者而言，使用它们相对是安全的，我们无需过多关心循环引用的问题。当把一个closure用作函数参数时，默认都是non escaping属性的，也就是说，它们只负责执行逻辑，但不会被外界保存和使用。
 */

func makeDescriptor<Key, Value>(
    key: @escaping (Key) -> Value,
    _ isAscending: @escaping (Value, Value) -> Bool
) -> SortDescriptor<Key> {

        return { isAscending(key($0), key($1)) }
}
