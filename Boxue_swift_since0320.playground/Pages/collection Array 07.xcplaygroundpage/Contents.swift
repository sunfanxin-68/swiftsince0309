//: [Previous](@previous)

import Foundation

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

//为视频观看记录提供一个默认值
let defaultRecord: [String: RecordType] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

//这样，当创建新纪录时，我们希望保持默认记录中的默认值，同时合并进不同用户的设置，例如：
var template = defaultRecord
var record11Patch: [String: RecordType] = [
    "uid": .number(11),
    "title": .text("Common dictionary extensions")
]

extension Dictionary {
    mutating func merge<S:Sequence>(_ sequence: S)
    where S.Iterator.Element == (key: Key, value: Value) {
        sequence.forEach{ self[$0] = $1 }
    //遍历sequence中的每一个元素 在他的colurses里让dictionary（self）
//里的key 等于 sequence中对应的value就好了
    }
    
    init<S:Sequence> (_ sequence: S)
    where S.Iterator.Element == (key: Key, value: Value) {
        self = [:]
        self.merge(sequence)
    }
    
    //给dictionary自定义一个mapvalue方法 同样是个泛型方法 T表示把value map之后的类型
//他的colurse参数 和实现map是类似的 接受一个dictionary中 值类型的参数 并返回T
    //最终 mapvalue返回一个新的dictionary value的类型变成了转换之后的T
    func mapValue<T>(_ transform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(map { ( $0, transform($1))})
        //transform是squence
    }
    
    
    
}

let newRecord11 = record11.mapValue { record -> String in
    switch record {
    case .text(let title):
        return title
    case .number(let exp):
        return String(exp)
    case .bool(let favourite):
        return String(favourite)
    }
}

// [
//    "uid": "11",
//    "title": "Common dictionary extensions"
// ]




let record11 = Dictionary(record11Patch)
// [
//    uid: .number(11),
//    "title": .text("Common dictionary extensions")
// ]






let record11PatchDic = Dictionary(record11Patch)
print(record11PatchDic)
print(record11PatchDic.map{ $1  })
//dictionary的map方法有两个参数， $0是 key $1 表示value 最终map方法会返回一个array







template.merge(record11Patch)
print(template)
// [
//    uid: .number(10),
//    "exp": .number(100),
//    "favourite": .bool(false),
//    "title": .text("Common dictionary extensions")
// ]
/*
 在上面的代码里，我们合并了一个tuple数组，它的类型是Array<String, RecordType>，
 数组中的每一项都包含了一个要合并进来的键值对。
 如果没有意外，合并Array和Dictionary都应该是可以正常工作的。
 按照我们对merge的实现方式，实际上，任何一个遵从了Sequence protocol的类型，只要它包含了和template相同的元素类型，都是可以merge的。

 */
/*Sequence
 Sequence 是一系列相同类型的值的集合，并且提供对这些值的迭代能力。

 迭代一个 Sequence 最常见的方式就是 for-in 循环*/
