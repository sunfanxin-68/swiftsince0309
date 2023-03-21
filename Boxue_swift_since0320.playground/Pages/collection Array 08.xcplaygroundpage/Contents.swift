//: [Previous](@previous)

import Foundation

/*本质上来说，Dictionary是一个哈希表，它所有的key都用各自的哈希值保存在一个数组里。因此，通过key在Dictionary中访问value是一个O(1)操作。
 但这也对key的类型做出了一个要求，它必须可以计算哈希值*/
struct Account {
    var alias: String //账号的别名
    var type: Int       //类型
    var createdAt: Date//注册日期
}


//如何计算Account.hashValue呢？有两个最重要的考量，分别是：性能和哈希值在整数范围的分布。
extension Account: Hashable {  //遵从hashable protocol
    var hashValue: Int {
        //hashable唯一的要求就是通过一个 hashValue的属性 读取对象的hash值 类型是int
        return type.hashValue ^ alias.hashValue ^ createdAt.hashValue
    }

}
extension Account: Equatable {
    //== 要为自定义类型实现相同比较操作符
    static func == (lhs: Account, rhs: Account) -> Bool {
//有两个参数 分别表示 等号两边的操作数
        return lhs.type == rhs.type &&
        lhs.alias == rhs.alias &&
        lhs.createdAt == rhs.createdAt
//在Swift里，运算符必须要定义成static方法，它的两个参数lhs / rhs则表示==两边的操作数。
//逐个比较两个参数的每个属性是否相等 只有属性完全相等的时候 两个account才是完全相等的
    }
}

//var data: [Account: Int]?
//
//struct Account {
//    let INT_BIT = (Int)(CHAR_BIT) * MemoryLayout<Int>.size
//
//    func bitwiseRotate(value: Int, bits: Int) -> Int {
//        return (((value) << bits) | ((value) >> (UINT_BIT - bits)))
//    }
//}
//
//extension Account: Hashable {
//    var hashValue: Int {
//        return bitwiseRotate(value: alias.hashValue, bits: 10) ^
//            type.hashValue ^
//            createdAt.hashValue
//    }
//}
//我们上面例子中提到的把所有属性进行XOR运算的方法，虽然简单高效，但也有一个问题，就是比较容易造成碰撞。因为XOR运算是可交换的，也就是说a ^ b == b ^ a，因此，如果一个自定义类型中，有多个类型相同属性的时候，就会增大哈希值发生碰撞的概率，因此，我们可以用下面的代码，对其中的一些基础属性的哈希值进行按位旋转后再进行XOR运算：
