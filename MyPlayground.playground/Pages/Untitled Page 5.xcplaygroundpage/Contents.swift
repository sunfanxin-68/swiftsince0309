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
 > # 注意点！：　<#ここから重要です :#>
 <#具体的な内容はこちら.#>
 1.<#アイテム1#>
 1. <#アイテム2#>
 1. <#アイテム3#>
 
 ---
 [また何があったら - <#こちらのリンクへ#><#www.google.com#>]
 */

/*:
 打开Code Snippet Librar
 # 打开Code Snippet Librar
 * command + shift + L 快捷键打开
 * Editor → create code shippet edit
 * 要注释的句子 后面加  #> 前面加上<#
 * Title表示代码片段的名称；
 * Summary表示代码片段的简单说明；
 * Platform表示代码片段在 iOS / macOS / watchOS / tvOS / All 中使用；
 * Language表示代码片段生效的语言；

 */


        /*:
         `IntArray` 类型的一句话描述.
         
         ## Overview
         An `IntArray` stores values of integers in an ordered list.
         类型的主要功能
         
         ## Initializers
         You can create an IntArray in the following ways:
         类型的常用初始化方法，下面的代码 swift文档注释要求和当前最近的缩进有一个tab 4个空格
         
         // An empty IntArray
         var empty: IntArray = []
         
         // Initialzied by an array literal
         var odds: IntArray = [0, 2, 4, 6, 8]
         
         // Initialized by a default value
         var tenInts: IntArray = IntArray(repeating: 0, count: 10)
         
         ## Value semantics
         - important:
         `IntArray` object perform value type semantics. But we have the COW optimization. 使用一个 - 号 叫 callout 可以突出显示内容 `类型对象的拷贝比.值类型还是引用类型
         
         
         Like all value types, `IntArray` use a COW optimization.
         Multiple copies of `IntArray` share the same storage as long as
         none of the copies are modified.
         我们可以使用三个及以上的-，表示一条分割线，用来区分正文和内容引用的部分；
         
         ---
         
         - note:
         Check [Swift Standard Library](https://developer.apple.com/reference/swift/array)
         for more informaton about arrays.
         */
  



