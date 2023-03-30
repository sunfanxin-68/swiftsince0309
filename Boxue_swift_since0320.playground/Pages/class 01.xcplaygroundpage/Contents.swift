//: [Previous](@previous)

import Foundation

//一个可修改的引用语义常量

//
//let numbers: NSMutableArray = [1, 2, 3, 4, 5]
//
//for _ in numbers {       // 迭代时会被崩溃
//
//    numbers.removeLastObject()
//}
//
//var numberIter = numbers.makeIterator()
//
//while let number = numberIter.next() {
////用while循环不断读取number下一个元素，模拟遍历numbers的动作
//    numbers.removeLastObject()//不断删除末尾的元素
//}
//
//
//let nubmers = [1, 2, 3, 4, 5]
//
//for _ in numbers {
//    // Compile time ERROR
//    numbers.removeLast()
//}


class Queue {
    var position = 0
    var array: [Int] = []
    
    init(_ array: [Int]) {
        self.array = array
    }

//获取队列的下一个元素
    func next() -> Int? {
        guard position < array.count else {
            return nil
        }
        
        position += 1
        
        return array[position - 1]
    }
}

//一个遍历Queue的函数
func traverseQueue(_ queue: Queue) {
    while let item = queue.next() {//用next方法while循环读取每一个元素
        print(item)
    }
}
let q = Queue([1, 2, 3, 4, 5])
traverseQueue(q)
// 1 2 3 4 5


for _ in 0..<10 {
    let q = Queue([1, 2, 3, 4, 5])
    
    DispatchQueue.global().async {
        traverseQueue(q) // May crash here
    }

    traverseQueue(q) // Or here
}
