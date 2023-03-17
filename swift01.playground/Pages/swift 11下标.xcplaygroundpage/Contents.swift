//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//使用关键字 subscript 来定义下标，并且指定一个或多个输入形式参数和返回类型
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let result = TimesTable(multiplier: 3)
print("6 * 3 = \(result[6])")
print("100 * 3 =\(result[100])")

struct Matrix {
    let rows :Int, columns: Int
    var grid : [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, columns: Int) -> Bool {
        return row >= 0 && row < rows && columns >= 0 &&
        columns < columns
    }
    subscript(row: Int, columns: Int) -> Double {
        get {
            assert(indexIsValid(row: row, columns: columns),
            "Index out of range")
            return grid[(row * columns) + columns]
        }
        set {
            assert(indexIsValid(row: row, columns: columns),"Index out of range")
            grid[(row * columns + columns)] = newValue
        }
    }
}
//var matrix = matrix(row: 2, columns: 2)
//matrix[0, 1] = 1.5
//matrix[1, 0] = 3.2
//
//func indexIsValidForRow(row: Int, columns: Int) -> Bool {
//    return row >= 0 && row < row && columns >= 0 && columns < columns
//}
//let someValue = matrix[2, 2]



//类型下标
enum Planet:Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
