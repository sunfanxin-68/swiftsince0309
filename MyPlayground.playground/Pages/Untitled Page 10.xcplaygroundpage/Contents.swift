//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
var mixStr = "Swift很有趣"

for (index, value) in mixStr.enumerated() {
    print("\(index): \(value)")
}

if let index = mixStr.firstIndex(of: "很") {
    mixStr.insert(contentsOf: " 3.0", at: index)
    // "Swift 3.0很有趣"
}
if let cnIndex = mixStr.firstIndex(of: "很") {
    // 2. Replace a specific range
    mixStr.replaceSubrange(
        cnIndex ..< mixStr.endIndex,
        with: " is interesting!")
    // Swift 3.0 is interesting!
}
let swiftView = mixStr.suffix(12).dropLast()
String(swiftView)

let strViews = mixStr.split(separator: " ")
strViews.map(String.init)
