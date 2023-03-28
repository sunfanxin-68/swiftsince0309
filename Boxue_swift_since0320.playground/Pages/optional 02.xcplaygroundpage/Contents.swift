//: [Previous](@previous)

import Foundation


enum Optional<T> {
    //泛型 可以统一返回一个optional
    case some(T) //成功的情况
    case none  //错误的情况
}

extension Array where Element: Equatable {
//约束array中的元素都是可以进行相等比较的
    func find(_ element: Element) -> Index? {
//element 类型是element表示要查找的元素 返回index表示要查找的元素的位置
        var index = startIndex //先用变量记录起始位置
        
        while index != endIndex {   //起始位置不等于结束位置
            if self[index] == element {  //比较两个是否相等 相等就找到了
                
                return .some(index)
        //并且返回 .some 并且返回 它的associated value
            }
            formIndex(after: &index)
    //否则，当while循环结束时，就返回.none
        }
        
        return nil      }
}

var numbers = [1, 2, 3]
let index = numbers.find(4)
type(of: index)

//为了使用index中的值，我们只能这样：
switch index {
    case let index?:
        numbers.remove(at: index)
//我们可以用case let index?这样的形式来简化读取.some的关联值，用case nil来简化case .none。
    case nil:
        print("Not exist")
}
/*这样 只要程序返回optional 函数返回Optional 编译器就会强制我们对调用成功和失败的情况明确分开处理。
 并且，当你看到一个函数返回了Optional，从它的签名就可以知道
 */



//index的类型就会变成Optional<Int>，于是，当我们尝试把这个类型传递给remove(at:)时：
//numbers.remove(at: index)
//不能把一个optional int 转换成一个 int


