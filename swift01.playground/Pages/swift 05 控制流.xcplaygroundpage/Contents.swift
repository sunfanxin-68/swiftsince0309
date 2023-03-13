//: [Previous](@previous)

import Foundation

//: [Next](@next)

let point = 20
for pointmark in 0..<point {
    print(pointmark)
}
//使用 stride(from:to:by:) 函数来跳过不想要的标记。
//stride(from: 開始値, to: 終了値, by: 刻み幅)
let pointInterval = 3
for pointmark in stride(from: 0, to: point, by: pointInterval){
    //生成されたリストに、toで指定した最終値は含まれません。
    print(pointmark)
}
 let pointthrough = 5
for pointmark in stride(from: 0, through: point, by: pointthrough) {
    print(pointmark)//生成されたリストに、throughで指定した最終値が含まれます。
}

var a = 5
while a < 10 {
    print(a)
    a += 1
}

// repeat while 至少执行一次 类似于 do while
var index = 5
repeat{
    print( "index 的值为 \(index)")
    index = index + 1
}while index < 10
 

var tem = -1
if tem < 0 {
    print("外头\(tem)度了，开空调吧")
}  else {
    print("そんな寒くない")
}

let garde = "A"
switch garde {
case "A":
    print("ステキ")
case "B":
    print("まーま")
default:
    print("ダメだね")
}

//switch情况的值可以在一个区间中匹配
let markpoint = 30
var comment: String
switch markpoint {
case 0..<50:
    comment = "カス"
case 50..<70:
    comment  = "普通"
case 70..<90:
    comment = "ナイス"
default:
    comment = "神"
}
print("君の成績は\(comment)だ")

var index2 = 13
repeat{
   index2 = index2 + 1
    
   if( index2 == 15 ){ // index 等于 15 时跳过
      continue
   }
//    if (index2 == 16){
//        break  index2 =16 的时候 停止循环
//    }
   print( "index 的值为 \(index2)")
}while index2 < 17

