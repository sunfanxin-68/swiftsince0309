//: [Previous](@previous)

import Foundation

//当一个类定义中包含其它类的属性时，这两个类的关系，就叫做composition

class PC {
    var cpu: CPU
    var mem: MEM
    var motherBoard: MotherBoard
}
//这时PC和它的三个属性之间的composition，就表达了HAS A的关系


class FIFOQueue {
    var storage: NSMutableArray
    
    init(_ storage: NSMutableArray) {
        self.storage = storage
    }
    
    var count: Int {　//获取队列元素个数
           return storage.count
       }
       
       func enqueue(element: Any) {
    //插入队列的方法 element表示插入的元素
           self.storage.insert(element, at: 0)
    //把 element插在队首
       }
   
    //退出队列的元素
       func dequeue() -> Any? {
           let last = storage.lastObject
    //先保存storage的最后一个元素，本身是一个optional
        
           self.storage.removeLastObject()
    //删除队尾
           
           return last
       }
}
//借用NSMutableArray，实现了一个最简单的队列。
