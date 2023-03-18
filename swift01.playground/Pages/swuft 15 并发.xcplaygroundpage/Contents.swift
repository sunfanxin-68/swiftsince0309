//: [Previous](@previous)

import Foundation

//: [Next](@next)


//定义和调用异步函数
/*可以在它的声明中的参数列表后边加上 async 关键字，和使用 throws 关键字来标记 throwing 函数是类似的*/
func listPhotos(inGallery name: String) async -> [String] {
    let result =   // 省略一些异步网络请求代码
    return result
}

//async 表示这闭包（closure）会用asynchronous的方式执行
// await：表示暂停点，后面接着的内容可以被暂停，稍后再执行
let photoNames = await listPhotos(inGallery: "Summer Vacation")
/*代码从第一行开始执行到第一个 await，调用 listPhotos(inGallery:) 函数并且挂起这段代码的执行，等待这个函数的返回。*/
let sortedNames = photoNames.sorted()
/*当这段代码的执行被挂起时，程序的其他并行代码会继续执行。比如，后台有一个耗时长的任务更新其他一些图库。那段代码会执行到被 await 的标记的悬点，或者执行完成。
 
*/
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
/*接下来的 await 标记是在调用 downloadPhoto(named:) 的地方。这里会再次暂停这段代码的执行直到函数返回，从而给了其他并行代码执行的机会。*/
/*在 downloadPhoto(named:) 返回后，它的返回值会被赋值到 photo 变量中，然后被作为参数传递给 show(_:)。*/


async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
/*代码中接下来的几行需要依赖异步函数的结果时，需要使用 await 来调用异步函数。这样产生的结果是有序的。
 
 短时间内并不需要异步函数的结果时，需要使用 async-let 来调用异步函数。这样产生的任务是并发的。

 await 和 async-let 都允许其他任务在他们被挂起的时候执行。

 在两种情况下，都需要用 await 标记可能的悬点，以表明代码在这些点在需要的情况下会被挂起，直到异步函数执行结束。
*/


await withTaskGroup(of: Data.self) {
    taskGroup in
    let photoNames = await listPhotos(inGallery: "夏休日")
    for name in photoNames {
        taskGroup.async {
            await downloadPhoto(named: name)}
        }
    }
}


//Actors 跟类一样，actor 也是一个引用类型，
/*actor 在同一时间只允许一个任务访问它的可变状态，这使得多个任务中的代码与一个 actor 交互时更加安全*/
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}
/*后边的花括号中是它的定义。TemperatureLogger 中有外部能访问到的属性，并且限制 max 变量，所以只能在 actor 内部修改最大值。*/
let logger = TemperatureLogger(label: "外", measurement: 25)
print(await logger.max)
// 输出 "25"

//actor 内部的代码在访问其属性的时候不需要添加 await 关键字
extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurements)
            if measurement > max {
                max = measurement
            }
        }
    }
//print(logger.max)  报错
/*
 1.你的代码调用 update(with:) 方法，并且先更新了 measurements 数组。
 
 2.在你的代码更新 max 前，其他地方的代码读取了最大值和温度列表的值。

 3.你的代码更新了 max 完成调用。
*/

