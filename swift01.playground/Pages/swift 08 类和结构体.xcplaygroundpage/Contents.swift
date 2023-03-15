//: [Previous](@previous)

import Foundation


//: [Next](@next)
//通过关键字 struct 来定义结构体：
//定义一个名为 MarkStruct 的结构体 ，结构体的属性为学生三个科目的分数，数据类型为 Int：
struct nameStruct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
    }
//通过结构体名来访问结构体成员。
struct studentMarks {
    var mark1 = 100
    var mark2 = 78
    var mark3 = 98
}
let marks = studentMarks()
print("Mark1 is \(marks.mark1)")
print("Mark2 is \(marks.mark2)")
print("Mark3 是 \(marks.mark3)")


//通过使用 let 关键字将结构体 studentMarks() 实例化并传递给 marks。
//最后就通过 . 号来访问结构体成员的值。
struct MarksStruct {
    var mark: Int
    init(mark: Int) {
        self.mark = mark
    }
}
var aStruct = MarksStruct(mark: 98)
var bStruct = aStruct
// aStruct 和 bStruct 是使用相同值的结构体！
bStruct.mark = 97
print(aStruct.mark)
print(bStruct.mark)


struct Resolution {
      var width = 0
      var height = 0
  }
  class VideoMode {
      var resolution = Resolution()
      var interlaced = false //非隔行扫描视频
      var frameRate = 0.0 //回放帧率为 0.0
      var name: String? //因为是可选项
  }
//创建结构体实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

print("解像度的宽度是\(someResolution.width)")
print("解像度的宽度是\(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280

print("解像度现在的宽度是\(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height : 1080)
var cinema = hd
cinema.width = 2048
print("cinema 现在有 \(cinema.width) pixels wide")
print("hd还是 \(hd.width) pixels wide")
//结构体实例是通过值传递的。
//cinema的宽度被设置 2048并不影响 hd中 width存储的值

//类是引用类型
//声明了一个新的名叫 tenEighty的常量并且设置它引用一个 VideoMode类的新实例
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//这时enEighty.frameRate通过引用变成了30
print(" frameRate 现在的属性是\(tenEighty.frameRate)")
