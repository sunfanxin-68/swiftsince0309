//: [Previous](@previous)

import Foundation

 
enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

//定义一个key的类型是String 值的类型是RecordType
let record11: [String: RecordType] = [
    "uid": .number(11),
    "exp": .number(100), //经验值
    "favourite": .bool(false),//是否收藏
    "title": .text("Dictionary basics") //视频标题
]
//可以直接用key索引值其中的value了
record11["uid"]
record11["favourite"]
record11["title"]
record11["invalid"]

// Optional<RecordType>.Type
//和Array不同的是，[]用在Dictionary的时候，
//会返回一个Optional类型来确保这种形式的访问安全。因此，访问不存在的key，并不会导致运行时错误。
type(of: record11["favourite"])


record11.count
record11.isEmpty
/*
 由于Dictionary是一个无序集合（unordered collection），
 因此当我们编辑了Dictionary之后，每次遍历，访问元素的顺序都可能是不同的。如果我们希望按照固定的顺序来访问Dictionary中的元素，一个最简单的办法，就是对key排序后，再进行遍历：
 */
record11.keys.sorted().forEach{ print("\($0): \(record11[$0])")}
record11.values

var record10 = record11
record10["favourite"] = .bool(true)
record11["favourite"]

//如果我们希望更新value的时候，同时获得修改前的值，还可以使用updateValue(_:forKey:)方法：
record10.updateValue(.bool(false), forKey: "favourite")
// 第一个参数表示要修改成的值 第二个参数forkey 表示要修改的值所对应的key
record10["watchLater"] = .bool(false)
print(record10)
//从上面的结果可以看出修改record10并不会影响record11。
//当我们要在Dictionary中添加元素时，直接给要添加的key赋值就好了：

//这样，record10中的内容，就变成了5项。而当我们要删除特定的key时，直接把它的值设置为nil：
record10["watchLater"] = nil
print(record10)


//当我们使用for循环遍历时，它的每一个元素都用一个tuple来表示，封装了每一个元素的key和value。
for (k, v) in record10 {
    print("\(k): \(v)")
}
record10.forEach { print("\($0): \($1)") }
//而当使用forEach方法时，它会给它的closure参数传递两个值，分别是每一个元素的key和value。
