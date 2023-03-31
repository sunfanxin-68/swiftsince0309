//: [Previous](@previous)

import Foundation


//ARC是如何工作的？
class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name)初期化されてる.")
    }
    
    deinit {
        print("\(name) 初期化されてる.")
    }
}
var ref1: Person? = Person(name: "Mars")
//count 1
//var ref2: Person? = ref1
//count 2

//ref1 = nil
// count = 1
//ref2 = nil
/*
 Person对象就没有任何strong reference了。它的引用计数会降为0，
 一旦如此，ARC就会立即回收掉Person对象。于是，我们就能在控制台看到Mars is being deinitialized.的提示了。
 */
// count = 0
// Mars is being deinitialized.

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) 初期化されてる.")
    }
    
    deinit {
        print("Apartment \(unit) 初期化されてる.")
    }
}

var mars: Person? = Person(name: "Mars")
var unit11: Apartment? = Apartment(unit: "11")

mars?.apartment = unit11
unit11?.tenant = mars

// count = 1
//mars = nil
// count = 1
//unit11 = nil






// count = 1
// Mars is being initialized.


//struct Person {
//    var name: String
//    var friends: [Person]
//}
//var mars = Person(name: "Mars", friends: [])
//mars.friends = [mars]

// name: "Mars", friends: [ name: "Mars", friends: [] ]

//var mars = Person(name: "Mars", friends: [])
//mars.friends = [mars]
// name: "Mars", friends: [ name: "Mars", friends: [] ]
