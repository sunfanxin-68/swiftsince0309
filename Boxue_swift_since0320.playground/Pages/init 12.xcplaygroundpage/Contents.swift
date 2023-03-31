import Compiler

/*
 Compiler的init方法不可访问。没错，你要记得一点，
 在Swift里，对类型的修饰并不会波及到它的属性和方法。所以，我们还要至少添加一个public init方法：

 */
public class Compiler {
    public init() {
        print("Compiler initiated")
    }
}
//public更适合共享具有值类型语义的对象。而要派生一个自定义类型，我们需要使用更开放的权限：open。
//使用open定义开放且需要扩展的接口
open class Compiler {
    var sourceFiles: [String]
    
    public init(_ sourceFiles: [String]) {
        self.sourceFiles = sourceFiles
        print("Compiler initiated")
    }
}
