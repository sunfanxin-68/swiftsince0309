//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
class Vehicle {
    var currentSpeed = 0.0
    //父类的description描述
    var description: String {
        return "以每小时 \(currentSpeed) 公里的速度行驶"
    }
    func makeNoise() {
        
    }
}
let someVehicle = Vehicle()
//在创建了一个新的 Vehicle 实例之后，你可以访问它的 description 属性来输出一个人类可读的汽车当前速度的描述：
print("Vehicle:\(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true

//可以在 Bicycle 类实例中修改继承而来的 currentSpeed 属性，或是查询实例中继承的 description 属性：
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("tandem: \(tandem.description)")

//重写 override
//定义了一个新的 Vehicle 子类，称为 Train ，
//它重写了 Train 继承自 Vehicle 的 makeNoise() 方法：
class Train: Vehicle{
    override func makeNoise() {
        print("choo choo")
    }
}
let train = Train()
train.makeNoise()

class Car: Vehicle{
    var gear = 1
    override var description: String {
        return super.description + "在齿轮\(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")

//属性观察器选择的档位就是新的 currentSpeed 值除以 10
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear - Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

