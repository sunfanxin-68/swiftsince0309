//: [Previous](@previous)

import Foundation

class Role {
   typealias PowerFn = (Role) -> Int
    
    var powerFn; PowerFn
    
    init(powerFn: @escaping PowerFn = {_ in return 0}) {
        self.powerFn = powerFn
    }
    
    
    
//    func doPower() -> Int { return 0 }
}

//通过extension Role添加一个可以公共访问，但是不能改写的方法：
extension Role {
    public func power() -> Int { //template method
    
//在这里做一些准备工作
    
        let value = powerFn(self)
    //调用doPower获取攻击力
    //在这里做一些后续
        return value
    /*
     这样，所有Role的派生类只需要做两件事情:
     1. 从Role派生；
     2.重定义doPower()方法；
     */
    }
}

class Player: Role {
//    fileprivate func doPower() -> Int {
//        return 100
//    }
}

let p1 = Player(powerFn: { _ in 100})
let p2 = Player(powerFn: { _ in 200})

p1.powerFn = { _ in 50}

enum Level {
    case simple, normal, hard
    
    func rolePower(role: Role) -> Int {
            switch self {
                case .simple:
                    return 300
                case .normal:
                    return 200
                case .hard:
                    return 100
            }
        }
    }
//设置一个玩家的攻击力：
let level = Level.simple
p1.powerFn = Level.rolePower(level)
//Level.rolePower的类型是这样的：(Level)->(Role)->Int，
