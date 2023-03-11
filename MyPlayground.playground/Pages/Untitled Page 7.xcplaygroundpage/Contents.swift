//: [Previous](@previous)

import UIKit


//Cafe
let cafe = "Caf\u{00e9}"
// e U00e9

let cafee = "Caf\u{0065}\u{0301}"


cafe.count
//cafee.characters.count
//characters' is unavailable: Please use String directly
//在swift5中已经舍弃了.characters的使用，如果用了则会出现报错。在Swift5中的使用更加方便，只要去掉
//.characters直接使用String类型的变量就可以了

cafe.utf8.count
cafee.utf8.count

cafe.utf16.count
cafee.utf16.count

cafe == cafee //

let nsCafe = NSString(characters: [0x43, 0x61, 0x66, 0xe9], length: 4)
nsCafe.length
let nsCafee = NSString(characters: [0x43, 0x61, 0x66, 0xe9, 0x0301], length: 5)
nsCafee.length
//在NSString看来，它们是长度不同的两个字符串。NSString类型则不会考虑不同字符组合起来的等价性，它只会按字面值进行计算和比较

/*:
    ##  NSString型とString型との違い
    1.  似たような名称の両者の違いを見ていきます。
    2. まずNSStringはObjective-Cで使用されていたデータ型であり、
    StringはS*wiftで追加された新しいデータ型になります。
    3.  またNSStringはクラスで、Stringは構造体として定義されています。
    
 :*/

nsCafe == nsCafee

let result = nsCafe.compare(nsCafee as String)
result == ComparisonResult.orderedSame

//标准等价 （canonically equivalent）
/*:
 ComparisonResult是一个枚举类型，包含了以下3个成员：
 其中：
 1. orderedAscending（-1）：左操作数小于右操作数。
 2.  orderedSame（0）：        两个操作数相等。
 3.  orderedDescending（1）：左操作数大于右操作数。

 */

let circleCafee = cafe + "\u{20dd}"
circleCafee.count

"😂".count
"👨‍👩‍👧‍👦".count
"🤦🏻‍♀️".count
"\u{200d}\u{200d}\u{200d}\u{200d}" == "👨‍👩‍👧‍👦"

let flags = "🇨🇳🇯🇵"
flags.count
