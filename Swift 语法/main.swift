//
//  main.swift
//  H240910Swift
//
//  Created by hwacdx on 2024/9/10.
//  Swift 语法学习链接：https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/

import Foundation

//使用var来制作变量
var aa = 10

//使用let来制作常量
let bb = 20

// 编译器推断 bb 是一个整数，因为它的初始值是一个整数。


var cc = aa + bb
var dd: Float = 3.14
print("Hello, World! ", dd)


let label = "the width is "
let width = 100

// 显示转换类型 int to string
let widthLabel = label + String(width)
//let widthLabel = label + width

print("widthLabel--> ", widthLabel)

//另一种方法：包含字符串的值
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."

//对占用多行的字符串使用 3个双引号
let quotation = """
    even though 
    for this line
    double quotes 

    I still have \(apples + oranges) pieces of fruit.
    """

print(quotation)

//使用括号创建数组和字典
var fruits = ["straw..", "limes", "tanger.."]
fruits[1] = "grapes"

var occ = ["key1": "value1",
           "key2": "value2"]

occ["key3"] = "value3" // 当您添加元素时，数组会自动增长。

print("fruits: \(fruits) - occ: \(occ)")


//使用括号来编写空数组或字典
fruits = []

occ = [:]


// 将空数组或字典分配给新变量或其他没有任何类型信息的地方，您需要指定类型
let emptyArray: [String] = []
let emptyDict: [String : Float] = [:]


//控制流程 if switch
let scores = [12, 32, 98, 46, 35]
var teamScore = 0

    // 条件或循环变量周围的括号是可选的
for score in scores {
    
    //在if语句中，条件必须是布尔表达式
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print("teamScore: \(teamScore)")

    // 可以在赋值的等号（=）后或return后写入if或switch，以根据条件选择值
let scoreDec = if teamScore > 10 {
    "11"
} else {
    "22"
}

print("score:\(teamScore) \(scoreDec)")


//可以使用if和let一起使用来处理可能缺失的值。这些值表示为可选值。可选值要么包含一个值，要么包含nil，以表示缺少一个值。
var optionalStr: String? = "hello"
print(optionalStr == nil)

var optionalName: String? = "zhang san"
var greeting = "hello !"

    // 如果可选值为nil，则条件为false，大括号中的代码将跳过。否则，可选值将被解包装，并在let后分配给常量，这使得解包装值在代码块中可用。
if let name = optionalName {
    greeting = "hello, \(name)"
}

print("greeting: \(greeting)")


//处理可选值的另一种方法是使用??提供默认值操作员。如果缺少可选值，则使用默认值。
let nickname: String? = nil
let fullname: String = "li si"
let greeting2 = "hi \(nickname ?? fullname)"

print("greeting2: \(greeting2)")

if let nickname {
    print("hey, \(nickname)")
}

// switch 支持任何类型的数据和各种比较操作——它们不限于整数和等式测试。
let vegetable = "red pepper"
switch vegetable {
case "aa":
    print("aa")
    
case "bb", "cc" :
    print("bb cc")
    
case let x where x.hasSuffix("pepper") :
    print("is it a spicy \(x)")
    
default:
    print("good in soup")
}


//使用for-in来迭代字典中的项目
let interNum = [
    "prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9 , 16, 25]
]

var largest = 0

for (_, numbers) in interNum { //todo 24.9.10 用变量名称替换_，并记录哪种数字是最大的
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print("largest: \(largest) ")

// 使用while重复代码块，直到条件发生变化
var n = 200
while n < 100 {
    n *= 2
}

print("n: \(n)")

// while 循环的条件可以在末尾，确保循环至少运行一次
var m = 200
repeat {
    m *= 2
} while m < 100
            
print("m: \(m)")
            
// 使用..<来制作索引范围，将索引保持在循环中
var total = 0
for i in 0..<4 {
    total += i
}

print("total: \(total)")


//函数和闭包

// 使用func来声明一个函数
func greet(person: String, day: String, breadPrice: Float) -> String {
    return "hello \(person), today is \(day), bread price is \(breadPrice)"
}

let result = greet(person: "bob", day: "tuesday", breadPrice: 12)
print("result: \(result)")


//参数标签
func greet2(_ person: String, on day: String) -> String {
    return "hello \(person), today is \(day)"
}

let result2 = greet2("john", on: "wednesday")
print("result: \(result2)")


//使用元组来制作复合值——例如，从函数中返回多个值
func calculate(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statis = calculate(scores: [5, 3, 100, 3, 9])
print("sum:", statis.sum)

// 元组的元素可以用名称或编号来引用
print(statis.2)


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    return y
}

let result3 = returnFifteen()
print("result3: \(result3)")


//一个函数可以返回另一个函数作为其值
func makeIncrementer() -> ((Int) -> Int ) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

// 将函数定义为常量使用
var increment = makeIncrementer()
let result4 = increment(7)
print("result4: \(result4)")


// 一个函数可以将另一个函数作为其参数之一
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            print("item2 : \(item)")
            return true
        }
        print("item1 : \(item)")
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
let result5 = hasAnyMatches(list: numbers, condition: lessThanTen)
print("result5: \(result5)")


//函数实际上是闭包的一个特殊情况：稍后可以调用的代码块
let result6 =  numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print("result6: \(result6)")


//使用更简洁的方式编写结尾
let mapNum = numbers.map({ number in 3 * number})
print(mapNum)


//通过编号而不是名称来引用参数
let sortNum = numbers.sorted { $0 > $1}
print(sortNum)


//对象和类
// 类中的属性声明的写法与常量或变量声明相同，只是它在类的上下文中。同样，方法和函数声明的编写方式相同。

class Shape {
    var numberOfSides = 0
    let temp = 0
    
    //不接受参数的方法，返回字符串
    func simpleDesc() -> String {
        return "a shape with \(numberOfSides) sides."
    }
    
    //接受参数的方法，返回字符串
    func simpleDesc2(name: String) -> String {
        return "Shape name is \(name)"
    }
}


//在类名称 后面加括号 来创建类的实例，使用点语法来访问 实例的属性和方法
var shape = Shape()
shape.numberOfSides = 7
var shapeDesc = shape.simpleDesc()
print("shapeDesc: \(shapeDesc)")

//设置类的初始化器
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDesc() -> String {
        return "a shape with \(numberOfSides) sides."
    }
}

var shape2 = NamedShape(name: "li si")
shape2.numberOfSides = 9
var shapeDesc2 = shape2.simpleDesc()
print("shapeDesc2: \(shapeDesc2)")


class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesc() -> String {
        return "a square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my square")
let tempResult = test.area()
let tempResult2 = test.simpleDesc()
print("tempResult: \(tempResult) - tempResult2: \(tempResult2)")


//属性的获取器和设置器
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength // 设置子类声明的属性值
        super.init(name: name) // 调用超类的初始化器
        numberOfSides = 3 // 更改超类定义的属性值
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        // 在 perimeter 设置器中，新值具有隐式名称 new
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDesc() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print("triangle.perimeter: \(triangle.perimeter)")

triangle.perimeter = 9.9
print("triangle.sideLength: \(triangle.sideLength)")


//如果您不需要计算属性，但仍然需要提供在设置新值之前和之后运行的代码，请使用will和did
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print("square.sideLengt: ", triangleAndSquare.square.sideLength)

print("triangle.sideLength: ", triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print("triangle.sideLength2: ", triangleAndSquare.triangle.sideLength)


//使用可选值
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
print("optionalSquare length: \(sideLength!)") // 解包装


//枚举和结构
// 使用enum来创建枚举。与类和所有其他命名类型一样，枚举可以有与之关联的方法。
enum Rank: Int {
    case ace = 1 // 赋予原始值为 1
    case two, three, four, five, six, seven, eight, nine, ten //其余的原始值按顺序分配
    case jack, queen, king
    
    func simpleDesc() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue //获取原始值
print("ace desc: \(ace.simpleDesc()) - aceRawValue: \(aceRawValue)")


if let convertedRank = Rank(rawValue: 3) {
    let threeDesc = convertedRank.simpleDesc()
}


enum Suit {
    case spades, hearts, diamonds, clubs
    
    func color(para: String) -> String {
        if para == "spades" || para == "hearts" {
            return "blank"
        } else {
            return "red"
        }
    }
    
    func simpleDesc() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.hearts
let heartsDesc = hearts.simpleDesc()
let color = hearts.color(para: "spades")
print("heartsDesc:\(heartsDesc) - color:\(color)")


//24.10.27
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("out of cheese.")

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure ... \(message)")
}


//结构，结构和类之间最重要的区别之一是，结构在代码中传递时总是被复制，但类是通过引用传递的。
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDesc() -> String {
        return "The \(rank.simpleDesc()) of \(suit.simpleDesc())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDesc = threeOfSpades.simpleDesc()
print("threeOfSpades: \(threeOfSpades) - threeOfSpadesDesc: \(threeOfSpadesDesc)")


//24.10.27 并发
// 使用async来标记异步运行的函数
func fetchUserId(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    
    //通过在异步函数前面写上 await 标记对异步函数的调用
    let userId = await fetchUserId(from: server)
    
    if userId == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

func connectUser(to server: String) async {
    async let userId = fetchUserId(from: server)
    async let username = fetchUsername(from: server)
    
    let greeting = await "Hello \(username), user ID \(userId)"
    print(greeting)
}

// 使用Task从同步代码中调用异步函数
Task {
    await connectUser(to: "primary")
}

// 使用任务组来构建并发代码
let userIds = await withTaskGroup(of: Int.self) { group in
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserId(from: server)
        }
    }
    
    var results: [Int] = []
    for await result in group {
        results.append(result)
    }
    return results
}

print("userIds: \(userIds)")


// actor 与类相似，只是它们确保不同的异步函数可以同时与同一演员的实例安全交互
actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    
    func connect() async -> Int {
        let userId = await fetchUserId(from: server)
        activeUsers.append(userId)
        return userId
    }
}

// 当您在 actor 上调用方法或访问其属性之一时，您将该代码标记为 await，以表明它可能必须等待已经在 actor 上运行的其他代码完成
let server = ServerConnection()
let userId = await server.connect()
print("server: \(server) - userId: \(userId)")


//24.10.27 协议和扩展
protocol ExampleProtocol {
    var simpleDesc: String { get }
    mutating func adjust()
}

// 类、枚举和结构都可以采用协议
class SimpleClass: ExampleProtocol {
    
    var simpleDesc: String = "A very simple class."
    var anotherProperth: Int = 69105
    
    func adjust() {
        simpleDesc += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDesc = a.simpleDesc

print("aDesc: \(aDesc)")

// 结构可以采用协议
struct SimpleStructure: ExampleProtocol {
    var simpleDesc: String = "A simple structure"
    
    // 使用mutating关键字来标记修改结构的方法
    mutating func adjust() {
        simpleDesc += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDesc = b.simpleDesc

print("bDesc: \(bDesc)")


// 使用extension为现有类型添加功能
extension Int: ExampleProtocol {
    var simpleDesc: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print("int extension: " + 7.simpleDesc)

extension Double: ExampleProtocol {
    var simpleDesc: String {
        return "The number \(self)"
    }
    
    var absolute: String { 
        return "The number absolute \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}


print("Double extension: " + 7.absolute)
