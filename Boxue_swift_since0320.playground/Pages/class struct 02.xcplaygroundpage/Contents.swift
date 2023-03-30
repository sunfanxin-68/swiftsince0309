//: [Previous](@previous)

import Foundation

//应该在什么地方使用struct
//一类是必须有明确生命周期的，它们必须被明确的初始化、使用、最后明确的被释放。例如：文件句柄、数据库连接、线程同步锁等等。这些类型的初始化和释放都不是拷贝内存这么简单，通常，这类内容，我们会选择使用class来实现。

//Default initializer  默认初始化器
struct Point {
    var x: Double
    var y: Double
    
    init(x: Double = 0, y: Double = 0) {  //memberwise initializer 成员初始化器
        self.x = x
        self.y = y
    }
    init(_ pt: (Double, Double)){
        self.x = pt.0
        self.y = pt.1
    }
    
}

var pointA = Point(x: 100, y: 200)
let orgin = Point() //我们就可以在创建Point时，不指定参数了：

var pointB = Point((200, 200))

//Type property

/*对于一个struct经常会使用的“特殊值”，除了每次我们自己定义之外，还可以在struct中定义成type property。它们不是struct对象的一部分，因此，不会增加Point对象的大小，还可以产生方便优美的代码：
 */

//print(Point.origin) // Point(x: 0.0, y: 0.0)


//理解struct的值语义
//定义一个Point变量：
var pointC = Point(x: 100, y: 100) {
/*
 为了观察这个变量被修改的事件，我们可以给它添加一个didSet block。这样，只要pointC发生变化，我们就会在控制台看到通知：
 */
    didSet {
        print("pointC changed: \(pointC)")
    }
}
pointC = pointB
pointC.x += 100


//为struct添加方法 计算两个Point之间的距离：

extension Point {
    func distance(to: Point) -> Double { //to表示self到目标点的位置
    //返回double 表示计算的结果
        let distX = self.x - to.x
        let distY = self.y - to.y

        return sqrt(distX * distX + distY * distY)//两点之间的距离
    }
 //必须使用mutating来修饰这样的方法：
    mutating func move(to: Point) {
           self = to
       
   }
}
point（pointC.distance(to: Point.origin))
pointC.move(to: pointA)
