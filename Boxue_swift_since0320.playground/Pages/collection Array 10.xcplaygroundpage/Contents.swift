//: [Previous](@previous)

import Foundation

var setA: Set = [1, 2, 3, 4, 5, 6]
var setB: Set = [4, 5, 6, 7, 8, 9]

//获取两个集合的交集
let interSectAB = setA.intersection(setB)
//intersection方法 接受一个参数 传递给他要计算交集的集合 SetB

let unionAB: Set = setA.union(setB)
//计算两个集合的并集

let aSubstractB: Set = setA.subtracting(setB)
//setA减去和SetB相同的元素而剩下的元素

//两个集合的对称差 就是减去相同类型的元素剩下的元素
let symmetricDiffAB: Set = setA.symmetricDifference(setB)

//上面这些API还有一个“可修改Set自身”的版本，而命名方式，就是在这些API的名称前面，加上form，例如：
setA.formIntersection(setB)

extension Sequence where Iterator.Element : Hashable {
//要求 sequence的类型必须可以计算哈希值的
    func unique() -> [Iterator.Element] {
//添加去重的方法 返回一个数组 包含序列中不重复的元素
        var tmp: Set<Iterator.Element> = []
//在它的实现里 先定义一个临时变量 是一个包含序列中元素类型的set 先让他等于一个空的集合
        
        return filter {
            //然后返回这个序列的筛选结果
            if tmp.contains($0) {
    //如果tmp中已将包含了原序列中当前被筛选的内容
                return false //就返回false
            } else {
                tmp.insert($0) //否则就把当前筛选的内容加入tmp
                return true
            }
        }
    }
}
//在这个例子里，我们使用了Set不能包含重复元素的特性，用result保存了所有已经筛选的元素，如果遇到重复的元素，就跳过，否则，就把它添加到result里用于下一次筛选。这样，我们就可以直接使用unique来去重了：

[1, 1, 2, 2, 3, 3, 4, 4].unique() //调用unique方法看去重效果 [1, 2, 3, 4]

/*Set是唯一一个支持SetAlgebra protocol的类型。但是，在Foundation里，却还有两个额外的类型：IndexSet和CharacterSet。
  其中，IndexSet和Set<Int>是非常类似的，例如：
 */
let oneToSix: IndexSet = [1, 2, 3, 4, 5, 6]
/*当我们要表达一连串正整数时，尤其是这个整数范围比较大的时候，使用IndexSet要比使用Set<Int>更经济一些，因为Set<Int>会保存这个范围里的每一个整数，而IndexSet则会使用类似1...6这样的形式保存一个范围。因此，要表达的范围越大，使用IndexSet就会越经济。并且，由于IndexSet也完全实现了SetAlgebra和Collection这两个protocol，因此，它的用法，和Set几乎是相同的。*/

// String
let hw = "Hello world!222"

// CharacterSet
let numbers = CharacterSet(charactersIn: "123456789")
let letters = CharacterSet.letters
//再定义一个变量表示 unicode 字符 直接读取 letter 属性
// Actions
hw.rangeOfCharacter(from: numbers) //有一个参数表示要判断的字符集合
//判断hw中是否包含数字 nil就是没有数字
hw.rangeOfCharacter(from: letters) //是否包含unicode字符
