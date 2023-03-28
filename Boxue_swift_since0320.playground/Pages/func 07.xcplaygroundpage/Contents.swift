//: [Previous](@previous)

import Foundation

func shift<T: Comparable>(
    _ compare: @escaping (T, T) -> Bool) -> (T?, T?) -> Bool {
    return { l, r in
        switch (l, r) {
        case (nil, nil):
            return false
        case (nil, _):
            return false
        case (_, nil):
            return true
        case let (l?, r?):
            return compare(l, r)
        default:
            fatalError()
        }
    }
}

let numbers = ["Five", "4", "3", "2", "1"]

let intDescriptor: SortDescriptor<String> =
    makeDescriptor(key: { Int($0) }, { l, r in  //把 比较逻辑直接写在makeDescriptor里
        switch (l, r) {
        case (nil, nil): //都为nil的时候
            return false
        case (nil, _): //有一方为nil的时候
            return false
        case (_, nil)://有一任何值和nil比较的时候
            return true
        case let (l?, r?):  //用value binding 来读取 l，r的值
            return l < r
        default:
            fatalError()
        }
    })
