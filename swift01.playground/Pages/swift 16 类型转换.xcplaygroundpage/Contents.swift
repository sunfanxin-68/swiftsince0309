//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*Swift 类型转换
 Swift 语言类型转换可以判断实例的类型。也可以用于检测实例类型是否属于其父类或者子类的实例。
 Swift 中类型转换使用 is 和 as 操作符实现，is 用于检测值的类型，as 用于转换类型。*/

/*它声明了一个 String 类型的 name 和一个叫做 init 的 name 初始化器。*/
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
//名为 director 的属性及其初始化器
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
//二个子类， Song ，增加了名为 artist 的属性及其初始化器。
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String ){
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablance", director: "Michael"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
/*类型检查
 
 使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类。
 如果实例是该子类类型，类型检查操作符返回 true ，否则返回 false 。*/
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("メデイアには\(movieCount)個の映画と\(songCount)曲の音楽がある")
//遍历了 library 数组中的每个元素。每一轮中， for-in 的循环都将 item 常量设置为数组中的下一个 MediaItem 。
/*如果当前 MediaItem 是 Movie 类型的实例， item is Movie 返回 true ，反之返回 false 。同样的， item is Song 检查了该对象是否为 Song 类型的实例。在 for-in 循环的最后， movieCount 和 songCount 的值就是数组中对应类型实例的数量。
 
*/
for item in library{
    if let movie = item as? Movie {
        print("Movie: `\(movie.name)`, dir.\(movie.director)")
        
    } else if let song = item as? Song {
        print("Song: `\(song.name)`, by \(song.artist)")
    }
}
/*“ if let movie = item as? Movie ”，它可以被读作：
 
 尝试以 Movie 类型访问 item 。如果成功，设置一个新的临时常量 movie 储存返回的可选 Movie 类型 。*/


//Any 和 AnyObject 的类型转换
/*Swift 为不确定的类型提供了两种特殊的类型别名：
 - AnyObject  可以表示任何类类型的实例。
 - Any  可以表示任何类型，包括函数类型。
 */

var things = [Any] ()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0,5.0))//一个 (Double, Double) 的元组
things.append(Movie(name:"君の名は", director: "新海誠"))
things.append({(name: String) -> String in "こんにちは, \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("零作为Int")
    case 0 as Double:
        print("零作为Double")
    case let someInt as Int:
        print("一个整数值为 \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("一个确定的Double \(someDouble)")
    case is Double:
        print("其他一些我不想打印的双值")
    case let someString as String:
        print("一个字符串值 \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("一个(x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("一个电影叫\(movie.name), 导演是 \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("佐藤"))
    default:
        print("something else")
            }
        }
