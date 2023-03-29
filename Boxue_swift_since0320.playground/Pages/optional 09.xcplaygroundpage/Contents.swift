//: [Previous](@previous)

import Foundation

/*
 就是当我们不得不面对force unwrapping的时候，可以采取的一些折衷的办法。它们至少可以帮我们在收拾残局的时候，提供一些更有用的信息，
 */
//改进force unwrapping的错误消息
var record = ["name": "11"]


infix operator !!
func !!<T>(optional: T?,
    errorMsg: @autoclosure () -> String) -> T {

    if let value = optional { return value }
    fatalError(errorMsg)
}

func !?(optional: Void?, errorMsg: @autoclosure () -> String) {
    assert(optional != nil, errorMsg())
}



record["type"] !! "Do not have a key named type"
