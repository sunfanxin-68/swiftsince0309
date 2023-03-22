//: [Previous](@previous)

import Foundation


extension Array where Element: Comparable {
    //添加归并排序的方法两个参数 begin排序数组的起始位置，类型 index end表示结束数组
    mutating func mergeSort(_ begin: Index, _ end: Index) {
        if (end - begin) > 1 {  //如果数组中包含的元素大于二 就需要继续分割
            let mid = (begin + end) / 2
//计算出分割的位置
            
            mergeSort(begin, mid)//左半部分归并排序
            mergeSort(mid, end) //右半部分归并排序

            merge(begin, mid, end)//merge方法把两摞数据合并起来
        }
    }
}

//如何实现这个merge方法
extension Array where Element: Comparable {
    private mutating func merge(_ begin: Index, _ mid: Index, _ end: Index) {
       
        var tmp: [Element] = []
        //先定义一个elemate类型的数组 空数组用来临时保存两摞数据合并的结果

        // 定义两个变量来保存两摞数据的起始位置。从两堆中获取较小的那个
        var i = begin
        var j = mid

        while i != mid && j != end {// //就表示俩摞数据中都包含被取走的元素
   
            if self[i] < self[j] {
                tmp.append(self[i])
                i += 1
            }
            else {
                tmp.append(self[j])
                j += 1
            }
        }

        // 当while循环结束后 肯定有一摞数字被取空了 需要吧剩余的数字直接添加到tmp末尾
        tmp.append(contentsOf: self[i ..< mid])
        tmp.append(contentsOf: self[j ..< end])

        
        replaceSubrange(begin..<end, with: tmp)
    }
}
var numbers = [1, 2, 33, 9, 8, 88]
numbers.mergeSort(numbers.startIndex, numbers.endIndex)
print(numbers)
