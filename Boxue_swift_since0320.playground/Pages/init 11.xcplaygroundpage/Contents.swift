//: [Previous](@previous)

import Foundation
class Role {
    var name: String
    lazy var action: () -> Void = { [weak self] in
            if let role = self {
                print("\(role) takes action.")
            }
        }
    
    //closure和类对象的关系并不那么明显。最典型的一类情况，就是类对象和closure之间还隔了一层API调用
    func levelUp() {
           let globalQueue = DispatchQueue.global()
//使用usleep(1000)来模拟角色升级时需要进行的设置
           globalQueue.async {
               print("Before: \(self) level up")
               usleep(1000)
               print("After: \(self) level up")
           }
       }
    
    
}
extension Role: CustomStringConvertible {
//让它实现了CustomStringConvertible
    var description: String {
        return "<Role: \(name)>"
    }
}


if true {
    var boss = Role("boss")
    let fn = { [ unowned boss] in
        print("\(boss) takes action.")
    }
    
    boss = Role("hidden boss")
    boss.action = fn

    boss.action = fn
}
/*
 boss引用的对象就不再有strong reference了，它会被回收。进而closure对象也就没有了strong reference，它也就被回收掉了。但是，只有在closure对象和它捕获的类对象“同生共死”的时候，使用unowned才是安全的
 */


var player: Role? = Role("P1")
player?.levelUp()

usleep(500)

print("Player set to nil")
player = nil

dispatchMain()
