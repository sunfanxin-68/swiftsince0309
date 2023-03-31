//: [Previous](@previous)

import Foundation

class Point2D {
    var x: Double
    var y: Double
    
    init(x:Double = 0, y: Double = 0) {
        self.x = x
        self.y = y
        
    }
    
    init?(xy: Double) {
        guard xy > 0 else { return nil }
        
        self.x = xy
        self.y = xy
    }
    
    convenience init(at:(Double, Double)) {
        self.init(x: at.0, y: at.1)
    }
    
    convenience init?(at: (String, String)) {
        guard let x = Double(at.0), let y = Double(at.1) else {
            return nil
        }
        
        self.init(at: (x, y))
    }

    
}

//什么是two-phase initialization
//阶段一：从派生类到基类，自下而上让类的每一个属性都有初始值
//阶段二：所有属性都有初始值之后，从基类到派生类，自上而下对类的每个属性进行进一步加工

class Point3D: Point2D {
    var z: Double = 0
    
    

    func initXYZ(x: Double, y: Double, z: Double) {
            self.x = round(x)
            self.y = round(y)
            self.z = round(z)
        }
    
    init(x: Double = 0, y: Double = 0, z: Double = 0) {
       //phase 1
        self.z = z
        super.init(x: x, y: y)
        
        //phase 2
        self.initXYZ(x: x, y: y, z: z)
    }
    override init(x: Double, y: Double) {
           self.z = 0
           super.init(x: x, y: y)
       }

       override init?(xy: Double) {
           if xy <= 0 { return nil }
           
           self.z = xy
           super.init(x: xy, y: xy)
       }
   
    
}

/*只要Point3D不定义自己的designated init，它就会自动继承Point2D的init方法。不信？我们可以用下面这些方式定义Point3D对象：*/
let origin3D = Point3D() // 0, 0, 0
let point11 = Point3D(x: 1, y: 1) // 1, 1, 0
let point22 = Point3D(x: 2) // 2, 2, 0
