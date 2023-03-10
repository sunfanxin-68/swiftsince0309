//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//:# Heading  1

/*:
  * item1
  * item2
  * item3
 */

struct IntArray {
func demo1 () {}
    /**
     A list demo func
       * item1
       * item2
       * item3
     */
    /**
    　# 注意点！：　ここから重要です
     具体的な内容はこちら.
     1. アイテム1
     1. アイテム2
     1. アイテム3
     
     ---
     [また何があったら - こちらのリンクへwww.google.com]
     */
    func listDemo(){}  //如果我们要把上面的注释放在项目代码里，出了要使用/**开始外，我们还要去掉第一行的>，因为Quick Help不支持这样的Markdown：
    
}
/// A **demo** function   Apple管它们叫做symbol documentation，符号文档？
func demo () {
    
}
//把光标放到demo1所在的行上，按住option点一下，就会弹出这个函数的说明，可以看到Xcode已经把markdown注释渲染了；
//按Option + Command + 2打开Quick Help Inspector，保持光标在demo1()所在行，同样，我们可以看到被渲染过的Markdown注释；

/*:
 > # 注意点！：　ここから重要です
 具体的な内容はこちら.
 1. アイテム1
 1. アイテム2
 1. アイテム3
 
 ---
 [また何があったら - こちらのリンクへwww.google.com]
 */

//: [To Pagethree](Pagethree)

/*:
  > # IMPORTANT: <#something important#>
  <#General description#>
  1. <#item1#>
  1. <#item2#>
  1. <#item3#>
  ---
  [More info - <#ref#>](<#Link#>)
*/

