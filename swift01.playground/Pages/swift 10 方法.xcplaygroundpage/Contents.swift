//: [Previous](@previous)

import Foundation

//: [Next](@next)
// Counter 类定义了三个实例方法：

class Counter {
    var count = 0
    func increment() {
        //increment每次给计数器增加 1；
        count += 1
    }
    func increment(by amount: Int){
        //increment(by: Int)按照特定的整型数量来增加计数器；
        count += amount
    }
    func reset() {
        //reset会把计数器重置为零。
        count = 0
    }
}
//调用实例方法与属性一样都是用点语法：
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOf(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOf(x: 1.0){
//    print("他的观点在线的右边，其中x == 1.0")
//}

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy( x deltax: Double, y deltaY: Double) {
        x += deltax
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("point现在是\(somePoint.x), \(somePoint.y)")

//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
//不能在常量结构体类型里调用异变方法，因为自身属性不能被改变，
//就算它们是变量属性：

struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        
        print(length)
        print((breadth))
    }
}
var val = area(length: 3, breadth: 5)
val.scaleBy(res: 3)
val.scaleBy(res: 2)
 

struct LevelTracker {
    static var highestUnlockLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlockLevel {
            highestUnlockLevel = level}
        }
        static func isUnlocked(_ level: Int) -> Bool {
            return level <= highestUnlockLevel
        }
        
        @discardableResult
        //把这个特性用在函数或方法的声明中，当调用一个有返回值的函数或者方法却没有使用返回值时，编译器不会产生警告。
        mutating func advance(to level: Int) -> Bool{
            if LevelTracker.isUnlocked(level) {
                currentLevel = level
                return true
            } else {
                return false
            }
    }
}
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String){
        playerName = name
    }
}
var player = Player(name: "player1")
player.complete(level: 1)
print("最高解锁级别现在是\(LevelTracker.highestUnlockLevel)")

player = Player(name: "player2")
if player.tracker.advance(to: 6) {
    print("玩家现在等级是6")
} else {
    print("6级还没被解锁")
}
