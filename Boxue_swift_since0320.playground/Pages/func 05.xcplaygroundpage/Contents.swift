//: [Previous](@previous)

import Foundation

final class Episode: NSObject {
    @objc var title: String
    @objc var type: String
    @objc var length: Int
    
    override var description: String {
        return title + "\t" + type + "\t" + String(length)
    }
    
    init(title: String, type: String, length: Int) {
        self.title = title
        self.type = type
        self.length = length
    }
}
let episodes = [
    Episode(title: "title 1", type: "Free", length: 520),
    Episode(title: "title 4", type: "Paid", length: 500),
    Episode(title: "title 2", type: "Free", length: 330),
    Episode(title: "title 5", type: "Paid", length: 260),
    Episode(title: "title 3", type: "Free", length: 240),
    Episode(title: "title 6", type: "Paid", length: 390),
]

let typeDescriptor = NSSortDescriptor(
    key: #keyPath(Episode.type),//key：表示要排序的属性；
    ascending: true,//ascending：表示是否按升序排序；
    selector: #selector(NSString.localizedCompare(_:)))
//selector：表示要进行比较的方法；

//定义一个Array<NSDescriptor>：
let descriptors = [typeDescriptor]

//最后，把episodes转型成NSArray，调用sortedArray(using:)方法，把descriptors传递给它：
let sortedEpisodes = (episodes as NSArray).sortedArray(using: descriptors)


sortedEpisodes.forEach { print($0 as! Episode) }
