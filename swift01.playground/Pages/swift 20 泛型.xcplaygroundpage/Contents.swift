//: [Previous](@previous)

import Foundation
//: [Next](@next)
/*泛型
 泛型代码让你能根据你所定义的要求写出可以用于任何类型的灵活的、可复用的函数。你可以编写出可复用、意图表达清晰、抽象的代码。*/
//下面的 swapTwoInts(_:_:) 是一个标准的非泛型函数，用于交换两个 Int 值：
func swapTwoInts(_ a: inout Int, _ b :inout Int) {
    let temporary = a
    a = b
    b = temporary
}
var someInt = 3
var anotherInt = 250
swapTwoInts(&someInt, &anotherInt)
print("someInt now is \(someInt),anotherInt is now \(anotherInt)")

/*
 如果你想交换两个 String 值，或者两个 Double 值，你只能再写更多的函数，比如下面的 swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:) 函数：
 */
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//唯一的区别是它们接收值类型不同（ Int 、 String 和 Double ）
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)


//使用一个名为 items 的数组属性来存储值
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
//提供了两个方法：push(_:) 和 pop()，
//用来向栈中压入值以及从栈中移除值。这些方法被标记为 mutating
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
/*上面的 IntStack 结构体只能用于 Int 类型。不过，可以定义一个泛型 Stack 结构体，从而能够处理任意类型的值。*/
struct Stack<Element> {
    var items: [Element] = []
//创建 items 属性，使用 Element 类型的空数组对其进行初始化。
    mutating func push(_ item: Element) {
        items.append(item)
//指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
/*用占位类型参数 Element 代替了实际的 Int 类型。这个类型参数包裹在紧随结构体名的一对尖括号里（<Element>）。
*/
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
//通过在尖括号中写出栈中需要存储的数据类型来创建并初始化一个 Stack 实例。
//例如，要创建一个 String 类型的栈，可以写成 Stack<String>()：
let fromTheTop = stackOfStrings.pop()
// fromTheTop 的值为“cuatro”，现在栈中还有 3 个字符串

//泛型扩展
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    //当栈为空的时候，topItem 会返回 nil；当栈不为空的时候，topItem 会返回 items 数组中的最后一个元素。
}
if let topItem = stackOfStrings.topItem {
    print("堆栈上的顶部项目是\(topItem).")
}

/*在一个 String 数组中查找给定 String 值的,若查找到匹配的字符串，findIndex(ofString:in:) 函数返回该字符串在数组中的索引值，否则返回 nil：*/
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "paraket", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("美洲驼的索引是\(foundIndex)")
}

//findIndex(of:in:) 类型参数写做 T: Equatable，
//也就意味着“任何符合 Equatable 协议的类型 T”。
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
//doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex 类型为 Int?，其值为 2

//关联类型实践
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
/*Container 协议定义了三个任何遵循该协议的类型（即容器）必须提供的功能：
 通过 append(_:) 方法添加一个新元素到容器里。
 通过 count 属性获取容器中元素的数量，并返回一个 Int 值。
 通过 count 属性获取容器中元素的数量，并返回一个 Int 值。
 */
struct Intstack: Container {
    // IntStack 的原始实现部分
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议的实现部分
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
/*
 Where 语句
 类型约束能够确保类型符合泛型函数或类的定义约束。
 你可以在参数列表中通过where语句定义参数的约束。
 */
/*定义了一个名为 allItemsMatch 的泛型函数，用来检查两个 Container 实例是否包含相同顺序的相同元素。如果所有的元素能够匹配，那么返回 true，否则返回 false。
 
*/
func allItemsMatch<C1: Container, C2: Container>
(_ someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.Item == C2.Item, C1.Item: Equatable {
    
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    //检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 所有元素都匹配，返回 true
    return true
}
/*这个函数接受 someContainer 和 anotherContainer 两个参数。参数 someContainer 的类型为 C1，参数 anotherContainer 的类型为 C2。C1 和 C2 是容器的两个占位类型参数，函数被调用时才能确定它们的具体类型。
 */

//var stackOfStrings = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//
//var arrayOfStrings = ["uno", "dos", "tres"]
//
//if allItemsMatch(stackOfStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}
//

//泛型下标
/*下标可以是泛型，它们能够包含泛型 where 子句。你可以在 subscript 后用尖括号来写占位符类型，你还可以在下标代码块花括号前写 where 子句。*/
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
    where Indices.Iterator.Element == Int {
        var result: [Item] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
/*在尖括号中的泛型参数 Indices，必须是符合标准库中的 Sequence 协议的类型。
 indices，必须是 Indices 的实例。
 */
