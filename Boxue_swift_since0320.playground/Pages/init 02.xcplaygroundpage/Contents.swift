//: [Previous](@previous)

import Foundation


//定义了一个class Point2D，表示平面中一个点的坐标：
class Point2D {
    var x: Double = 0
    var y: Double = 0
    
    //默认init let origin = Point2D()
    //memberwise init方法
    init(x: Double = 0, y: Double = 0) {
        self.x = x
        self.y = y
    }
    //Convenience init
    convenience init(at: (Double, Double)) {
           self.init(x: at.0, y: at.1)
       }
    //使用convienience关键字修饰；
  //必须最终调用designated init完成对象的初始化；如果我们直接在convenience init中设置self.x或self.y，会导致编译错误；
    
    convenience init?(at: (String, String)) {
    //由于String tuple版本的init有可能失败，我们需要用init?的形式来定义它
          guard let x = Double(at.0),
              let y = Double(at.1) else {
                  return nil
              }
//如果参数中的String无法转换成Double，我们就返回nil，表示构建失败。否则，就调用Double tuple版本的convenience init最终完成对象的创建。
          self.init(at: (x, y))
      }
    
    
    
    
}
