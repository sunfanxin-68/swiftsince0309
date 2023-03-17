//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
struct Fahrenheit {
    var temperature : Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("默认温度\(f.temperature)° 华士")

//通过提供 temperature 属性的默认值，你可以把上面的 Fahrenheit 结构体写的更简单：
//struct Fahrenheit {
//    var temperature = 32.0
//}

struct Celsius {
    var temperatureInCelsuis: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsuis = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsuis = kelvin - 273.15
        
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfwater = Celsius(fromKelvin: 273.15)


struct Color {
    let red, blue, green: Double
    init(red: Double, blue: Double, green: Double){
        self.red = red
        self.blue = blue
        self.green = green
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
//始化器可以用来创建新的 Color 实例：
let magenta = Color(red: 1.0, blue: 1.0, green: 0.0)
let halfGray = Color(white: 0.5)

struct Celsiusnew {
    var temperatureInCelsius: Double
    init (fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelevin kelevi: Double) {
        temperatureInCelsius = kelevi - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsiusnew(37.0)

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "チーズは好きですか?")
cheeseQuestion.ask()
cheeseQuestion.response = "はい、チーズは好きです"

struct Rectangle {
    var length: Double?
    
    init(frombreadth breadth: Double){
        length = breadth * 10
    }
    init(frombre bre: Double){
        length = bre * 30
    }
    init(_ area: Double) {
        length = area
    }
}
let rectarea = Rectangle(180.0)
print("面積は：\(String(describing: rectarea.length))")
let rearea = Rectangle(370.0)
print("面積は: \(String(describing: rearea.length)) ")
let recarea = Rectangle(110.0)
print("面積は: \(String(describing: recarea.length))")
//当存储属性声明为可选时，将自动初始化为空 nil。


//它将自动获得一个可以为所有属性设置默认值的默认构造器
class ShoppingListitem {
    var name: String?
    var quqntity = 1
    var purchased = false
}
var item = ShoppingListitem()

print("名前は \(String(describing: item.name))")
print("数字はは \(item.quqntity)")
print("支払いますか \(item.purchased)")


//结构体类型的成员初始化器 结构体会接收成员初始化器即使它的存储属性没有默认值。

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)


//指定和便捷初始化器的实战
// Food 类引入了一个名为 name 的 String 属性还提供了两个创建 Food 实例的初始化器：
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
//Food 类提供了一个接受单一实际参数的指定初始化器叫做 name 。这个初始化器可以使用一个具体的名称来创建新的 Food 实例：
let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"
class RecipeIngredient: Food {
    var quantity: Int
   init(name: String, quantity: Int) {
       self.quantity = quantity
       super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
        
    }
}
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name:"Eggs", quantity: 6),
    ]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
    
}
//应用反初始化器
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coin numberOfCoinsResquested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsResquested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coin: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coin: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
var playerOne: Player? = Player(coins: 100)
print("一名新玩家加入了游戏 \(playerOne!.coinsInPurse) coins")
print("现在有 \(Bank.coinsInBank)个coins 返回了银行")

playerOne!.win(coins: 2_000)
print("玩家赢得了2000coins然后现在\(playerOne!.coinsInPurse)coins")
print("银行现在只有\(Bank.coinsInBank)个硬币了")

playerOne = nil
print("玩家离开了游戏")
print("银行现在有\(Bank.coinsInBank)个coins")
