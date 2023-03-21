//: [Previous](@previous)

import Foundation

1 ..< 5 //表示的半开半闭区间[1, 5)；
1 ... 5  //表示的闭区间[1, 5]；

for i in 1 ..< 5 {
    print(i)
}

//为了遍历这样的浮点数区间，我们只能用stride(from:to:by:)和stride(from:though:by:)来指定起始、结束范围以及步进值。
// 前者，类似于半开半闭区间，后者类似于闭区间：
for i in stride(from: 1.0, to: 5.0, by: 1.0) {
    //form 表示起点 to 终点 by 表示 每次迭代值
    print(i)
}
// 1.0 2.0 3.0 4.0

//through 是闭区间的 在控制台就能看到5.0的输出了lo o
for i in stride(from: 1.0, through: 5.0, by: 1.0) {
    print(i)
}
// 1.0 2.0 3.0 4.0 5.0
