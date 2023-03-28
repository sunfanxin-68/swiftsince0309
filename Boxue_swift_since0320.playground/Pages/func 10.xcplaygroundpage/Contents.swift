//: [Previous](@previous)

import Foundation
/*
 inout引数（In-Out Arguments）: 関数やメソッドに、変数を渡してその値を関数やメソッド内で変更し、変更を呼び出し元に反映させる引数です。引数宣言の前にinoutを付けて宣言します。
 */


/*
 inout引数（In-Out Arguments）: 関数やメソッドに、変数を渡してその値を関数やメソッド内で変更し、変更を呼び出し元に反映させる引数です。引数宣言の前にinoutを付けて宣言します。
    */

func addTwo(to x: inout Int) {
    x += 2
}
//xはinout引数です。也就是inout参数



func incremental(_ i: inout Int) -> Int {
    i = i + 1
    return i
}
var i = 0
incremental(&i) // 1


struct Color {
    var r: Int
    var g: Int
    var b: Int
}

var red = Color(r: 254, g: 0, b: 0)
incremental(&red.r)


//在内嵌函数中访问inout参数的例子。我们可以内嵌函数中使用inout参数：
func doubleIncrement(_ i: inout Int) {
    func increment() {   //内嵌函数
        i += 1
    }

   increment()
   increment()
}
doubleIncrement(&i)
print(i)

//但是，我们却不能通过内嵌函数，让inout参数逃离函数的作用域：
