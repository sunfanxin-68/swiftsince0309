//: [Previous](@previous)

import Foundation

protocol FinishAlertViewDelegate  {
     mutating func buttonPressed(at index: Int)
}

class FinishAlertView {
    var buttons: [String] = [ "Cancel", "The next" ]
    var delegate: FinishAlertViewDelegate?
    
    func goToTheNext() {
        delegate?.buttonPressed(at: 1)
    }
}

struct PressCount: FinishAlertViewDelegate {
    var count = 0 //定义一个属性 count 用于记录点击次数
    
    mutating func buttonPressed(at index: Int) { //来实现 delegata方法
        self.count += 1
    }
}
