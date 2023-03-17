//: [Previous](@previous)

import Foundation

//: [Next](@next)

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
//下面的代码通过抛出一个错误来明确自动售货机需要五个额外的金币：

/*在下边的例子中， VendingMachine类拥有一个如果请求的物品不存在、卖光了或者比押金贵了就会抛出对应的 VendingMachineError错误的 vend(itemNamed:)方法：*/

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
        ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded:  item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("分配\(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

/*上面 PurchasedSnack 结构体的初始化器调用可抛出的函数作为初始化过程的一部分，
 然后它把遇到的任何错误都传递给它的调用者。*/
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


//使用 Do-Catch 处理错误
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("美味しい！！！")
} catch VendingMachineError.invalidSelection {
    print("無効の選択")
} catch VendingMachineError.outOfStock {
    print("売り切れ")
} catch VendingMachineError.insufficientFunds(let coinsNeesed) {
    print("金額足りない、余分の\(coinsNeesed)コインを入れてください")
} catch {
    print("\(error)")
}

