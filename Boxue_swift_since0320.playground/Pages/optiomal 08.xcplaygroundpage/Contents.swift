//: [Previous](@previous)

import Foundation

extension Sequence {
    func myFlatMap<T>(_ transform:
        (Iterator.Element) -> T?) -> [T] {
        return self.map(transform)
            .filter { $0 != nil }
            .map { $0! } // Safely force unwrapping
    }
}
/*
 在我们用filter { $0 != nil }过滤掉了self中，所有的非nil元素之后，在map里，我们要获得所有optional元素中包含的值，这时，对$0使用force unwrapping，就满足了之前提到的两个条件：

 我们可以确定此时$0一定不为nil；
 我们也确定真的必须如此；
 */


//表示视频信息的Dictionary，  Key表示视频的标题，Value表示视频的秒数。
let episodes = [
    "The fail of sentinal values": 100,
    "Common optional operation": 150,
    "Nested optionals": 180,
    "Map and flatMap": 220,
]

episodes.keys
    .filter { episodes[$0]! > 100 }
    .sorted()

//print(episodes.keys.filter{ episodes[$0]! > 100 }.sorted())

print(episodes.filter { (_, duration) in duration > 150 }//new dictionary
    .map { (title, _) in return title }  //get string array
    .sorted()) //进行排序

