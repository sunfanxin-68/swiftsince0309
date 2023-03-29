//: [Previous](@previous)

import Foundation


extension Optional {
    func myMap<T>(_ transform: (Wrapped) -> T) -> T? {
//Wrapped参数，这是Optional类型的泛型参数 表示optional实际包装的值的类型
        if let value = self {   //先用value binding读取self的值
            return transform(value)
        }

        return nil
    }
    
    func myFlatMap<T>(_ transform: (Wrapped) -> T?) -> T? {
            if let value = self,
                let mapped = transform(value) {
                return mapped
            }

            return nil
        }
    }
}

//我们要把一个String?的内容在非空时，转换为大写，可以这样：
let swift: String? = "swift"
let SWIFT = swift.map { $0.uppercased() }//对$0调用uppercased的参数
//对于optional类型来说，如果它的值非nil，map就会把unwrapping的结果传递给它的closure参数，否则，就直接返回nil
//我们就得到了一个包含大写的新的Optional<String>，值是“SWIFT”
print("\(SWIFT)")


//重载Array.reduce方法
extension Array {
    func reduce(_ nextResult:
        (Element, Element) -> Element) -> Element? {
//由于map方法可以根据optional变量的值自动执行后续的行为，我们可以对first属性调用map来合并上面的guard和return：
        return first.map {
            dropFirst().reduce($0, nextResult)
    //如果first为nil，map就返回nil，否则，就从Array中的第一个元素开始reduce。然后，只接受一个+版本的reduce就也可以正常工作了。
        }
        
    }
}

let numbers = [1, 2, 3, 4]
let sum = numbers.reduce(+) // 10



let stringOne: String? = "1"
let oo = stringOne.flatMap { Int($0) }
type(of: oo) // Optional<Int>
//比于map来说，flatMap会对它的closure参数的返回值进行处理，当返回非nil时，就直接把这个返回值返回；否则，就返回nil。这样，我们就获得了一个新的单层optional对象。


if let stringOne = stringOne, let o = Int(stringOne) {
    print(o)    // 1
    type(of: o) // Int
}
/*
 我们用第一个if let绑定了stringOne中的非nil值，
 并尝试把这个值转换成整数。由于这个转换结果也是一个optional，我们再次使用了if let绑定了转换后的非nil结果。
 */



extension Sequence {
    func myFlatMap<T>(_ transform:  (Iterator.Element) -> T?) -> [T] {
        return self.map(transform)
            .filter { $0 != nil }
            .map { $0! }
    }
}
//要把ints中的元素转换成Int然后求和，该怎么做呢？先对ints调用map把[String]变成[Int?]
let ints = ["1", "2", "3", "4", "five"]
var all = ints.compactMap { Int($0) }.reduce(+)


print(all)

    
