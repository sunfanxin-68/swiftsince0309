//: [Previous](@previous)

import Foundation

//: [Next](@next)

//用 enum关键字来定义一个枚举，然后将其所有的定义内容放在一个大括号（ {}）中：
enum SomeEnumeration {
    
}
enum CompassPoint {
    //case关键字则明确了要定义成员值。
    case north
    case south
    case east
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var directionToHead = CompassPoint.west

directionToHead = .south
directionToHead = .east
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")

}
//let somePlanet = Planet.earth
//switch somePlanet {
//case .earth:
//    print("Mostly harmless")
//default:
//    print("Not a safe place for humans")
//}
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmels")
default:
    print("不适合人类居住")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count  //遍历枚举情况
print("\(numberOfChoices) beverages aviliable")

for beverage in Beverage.allCases {
   //Beverage.allCases 来访问包含 Beverage 枚举所有情况的集合
    print(beverage)
}

//原始值
//在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
//例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}
let yearMonth = Month.May.rawValue
print("数字月份为: \(yearMonth).")

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four) //sum 4,5
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
// product = 4+5 2

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right): //两个元素相乘 (4 + 5) * 2 =18
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
