//: [Previous](@previous)

import Foundation
//: [Next](@next)

//内存访问性质
//如果一个访问不可能在其访问期间被其它代码访问，那么就是一个瞬时访问
func oneMore(than number: Int) -> Int {
    return number + 1
    
}
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

//In-Out 参数的访问冲突
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
//increment(&stepSize)
// 错误：stepSize 访问冲突
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize

//在方法中对 self 的访问冲突

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK


struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常
