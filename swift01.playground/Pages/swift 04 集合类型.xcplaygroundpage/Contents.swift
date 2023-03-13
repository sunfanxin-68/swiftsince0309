//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//使用默认值创建数组 传给初始化器对应类型的默认值（叫做 repeating）和新数组元素的数量（叫做 count）
var threeDoubles = Array(repeating: 0.0, count: 3)
//就是 一个数组 初始值是0.0 同样的初始值数量有3个

var anotherThreeDoubles = Array(repeating: 2.5, count: 2)
var fiveDoubles = anotherThreeDoubles + threeDoubles
//可以通过把两个兼容类型的现存数组用加运算符（ +）加在一起来创建一个新数组。

//以数组集合来写一个或者多个值
var shoppingList: [String] = ["Eggs","Milk"]//因为声明了String 所以只能储存 string值类型
//这个数组已有两个初始化字符串元素

var shoppingList2 = ["Eggs", "Milk"]
//swift可推断出 var shoppingList = ["Eggs", "Milk"]

//要得出数组中元素的数量，检查只读的 count属性：
print("ショッピングリストには\(shoppingList.count)項目を含めてる")

//使用布尔量 isEmpty属性来作为检查 count属性是否等于 0的快捷方式：
if shoppingList.isEmpty {
    print("リストは何もない")
} else {
    print("リストは空っぽじゃない")
}

//可以通过 append(_:)方法给数组末尾添加新的元素：
shoppingList.append("Butter")

//可以使用加赋值运算符 ( +=)来在数组末尾添加一个或者多个同类型元素：
shoppingList += ["Cheese", "Chocolat","lemon"]

shoppingList[0] = "Six eggs" //更改数组第一个元素
//print(shoppingList)

shoppingList[3...5] = ["apple", "peach"] //更换数组中索引号4和5的元素
//把元素插入到特定的索引位置，调用数组的 insert(_:at:)方法：
shoppingList.insert("suger", at: 0)
print(shoppingList)

//可以使用 remove(at:)方法来移除一个元素。这个方法移除特定索引的元素并且返回它
let sugerremove = shoppingList.remove(at: 0)
print(shoppingList)

shoppingList.removeLast() //删除数组最后一个元素 用 removeLast()
print(shoppingList)

//用 for-in循环来遍历整个数组中值的合集：
for item in shoppingList {
    print(item)
}

//enumerated()方法返回数组中每一个元素的元组，包含了这个元素的索引和值。
 for (index, value) in shoppingList.enumerated() {
     print("\(index): \(value)")
    
}
//合集类型语法 Swift 的合集类型写做 Set<Element>，这里的 Element是合集要储存的类型。不同与数组，合集没有等价的简写
var letters = Set<Character>()
print("letters的类型为\(letters.count)")
letters.insert("a")
letters = []

var number1: Set<String> = ["1", "2", "3"]
var number2: Set = ["1", "2", "3"]
print(number1)
print(number2)

//创建一个空字典
var namesOfIntegers = [Int: String]()
// key是 Int类型 value是 String类型
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)

var airports = ["YYZ": "Toronto ", "DUB": "Dublin"]
//可以使用 count只读属性来找出 Dictionary拥有多少元素：
print("空港では\(airports.count)個スポットがある")

//可以用下标脚本给字典添加新元素。使用正确类型的新键作为下标脚本的索引，然后赋值一个正确类型的值
airports["TYO"]  = "Tokyo"
print(airports)
//现在airports有三个元素了
//可以使用下标脚本语法来改变特定键关联的值：
airports["TYO"] = "Tokyo Tower"

print(airports)
if let oldValue = airports.updateValue("sky tree", forKey: "TYO") {
    print("The old value for TYO was \(oldValue).")
    //还是输出旧值是 tokyo tower
}
print(airports)//新的值是sky tree

if let airportName = airports["YYZ"] {
    print("空港のエアスポットは \(airportName).")
} else {
    print("空港の中そんな名前いない.")
}

//以使用下标脚本语法给一个键赋值 nil来从字典当中移除一个键值
airports["TYO"] = nil
print(airports) //删除了TYO

for (indexairport, keyairport) in airports {
    print("\(indexairport): \(keyairport)")
}

//通过访问字典的 keys和 values属性来取回可遍历的字典的键或值的集合：
for airportcode in airports.keys {
    print(airportcode)
}
for airportname in airports.values {
    print(airportname)
}

//接收 Array实例的 API 一起使用字典的键或值，就用 keys或 values属性来初始化一个新数组：
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
