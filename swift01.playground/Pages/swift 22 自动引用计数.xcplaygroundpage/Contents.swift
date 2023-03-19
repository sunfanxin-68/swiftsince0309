//: [Previous](@previous)

import Foundation

//: [Next](@next)
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) 正在初始化")
    }
    deinit {
        print("\(name)正在取消初始化")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "john")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
//在你清楚地表明不再使用这个 Person 实例时，即第三个也就是最后一个强引用被断开时，ARC 会销毁它：
reference3 = nil

//类实例之间的循环强引用
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) 正在取消初始化") }
}
 /*每一个 Person 实例有一个类型为 String，名字为 name 的属性，并有一个可选的初始化为 nil 的 apartment 属性。apartment 属性是可选的，因为一个人并不总是拥有公寓。
  */
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment \(unit) 正在取消初始化") }
}
/*每个 Apartment 实例有一个叫 unit，类型为 String 的属性，并有一个可选的初始化为 nil 的 tenant 属性。tenant 属性是可选的，因为一栋公寓并不总是有居民。*/

var john: Person?
var unit4A: Apartment?

john = Person(name: "john Appleseed")
unit4A = Apartment(unit: "4A")

/*无主可选引用
 
 可以将类的可选引用标记为无主引用。按照 ARC 的所有权模型，无主可选引用和弱引用都可以在同一上下文里使用。区别是使用无主可选引用时，需要保证引用的对象总是合法的，或者将它设置为 nil。
*/
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
let department = Department(name: "园艺")

let intro = Course(name: "植物调查", in: department)
let intermediate = Course(name: "种植普通草药", in: department)
let advanced = Course(name: "照顾热带植物", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]
//ntro 和 intermediate 课程都将建议的后续课程存储在它们的 nextCourse 属性中

/*下面的例子定义了两个类，Country 和 City，每个类将另外一个类的实例保存为属性。
 在这个模型中，每个国家必须有首都，每个城市必须属于一个国家。为了实现这种关系，Country 类拥有一个 capitalCity 属性，
 而 City 类有一个 country 属性：
 */
class Country {
    let name :String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
//City 的构造器接受一个 Country 实例作为参数，
    //并且将实例保存到 country 属性。
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "日本", capitalName: "東京")
print("\(country.name)の首都は\(country.capitalCity.name)")

//闭包的循环强引用
/*下面的例子为你展示了当一个闭包引用了 self 后是如何产生一个循环强引用的。例子中定义了一个叫 HTMLElement 的类，用一种简单的模型表示 HTML 文档中的一个单独的元素：*/
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)"
        } else {
            return "<\(self.name) /"
        }
    }
    init(name: String, text: String? = nil) {
           self.name = name
           self.text = text
       }
    deinit {
        print("\(name)is being deinitialized")
    }
}
