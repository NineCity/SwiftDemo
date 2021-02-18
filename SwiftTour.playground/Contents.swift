import UIKit

/*=================================简单值=================================*/
// let常量，var变量，类型推断以及类型指定
let integerNum = 6
var floatNum : Float = 4
// integer: 6 float: 4.0
print("integer:",integerNum,"float:",floatNum)

let apples = 5
let oranges = 6
// 两种拼接字符串的方法
let fruitSum = "I have \(apples + oranges) pieces of fruit."
let aFruitSum = "I have " + String(apples + oranges) + " pieces of fruit."
// I have 11 pieces of fruit.
// I have 11 pieces of fruit.
print(fruitSum + "\n" + aFruitSum)

// """里的内容会完全输出，里面包含的空格、换行、引号等都会原封不动的输出，可以使用\()语法进行计算
let quotation = """
    I said "I have \(apples) apples, \(oranges) oranges"
and then I said "I have \(apples + oranges) pieces of fruit."
"""
//     I said "I have 5 apples, 6 oranges"
// and then I said "I have 11 pieces of fruit."
print(quotation)

// 数组或者字典最后一个元素后面可以有逗号
var shoppingList = ["catfish", "water", "tulips",]
shoppingList[1] = "bottole of water"
shoppingList.append("blue paint")

var occupations = [
    "Tom":"Caption",
    "Jane":"Mechanic",
]
occupations["Lily"] = "Public Relations"
// shoppingList: ["catfish", "bottole of water", "tulips", "blue paint"] occupations: ["Tom": "Caption", "Jane": "Mechanic", "Lily": "Public Relations"]
print("shoppingList:",shoppingList,"occupations:",occupations)

// 创建一个空数组或者字典的语法
let emptyArray = [String]()
let emptyDictionary = [String : Float]()

// 如果类型推断可以推出数组或者字典的类型，空数组或者空字典可以不用指定类型
shoppingList = []
occupations = [:]

/*=================================控制流=================================*/
let individualScores = [34,67,90,76,23]
var teamScore = 0
// 条件或者循环变量的小括号可以省略，循环体或者条件语句后的的大括号是必须的
// if条件语句的条件必须是布尔值，所以不能写成 if score { ... },因为它不会和0进行比较，区别于OC
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
// TeamScore: 11
print("TeamScore:",teamScore)

var optionalString : String? = "Hello"
// false
print(optionalString == nil)

var optionName : String? = "John"
var greeting = "Hello!"

// if let组合会解包可选类型optionName并将它的值赋给let后面的常量name，
// 然后可以在后面的代码块中使用这个常量name，如果optionName为nil，则if后面的条件为false
if let name = optionName {
    greeting = "Hello, \(name)"
}else {
    greeting = "Hello, nobody"
}
// greeting: Hello, John
print("greeting:",greeting)

// ?? 表示后面可以提供一个默认值，当可选类型nickname为nil时候，就是用 ?? 后面的值
let nickname : String? = nil
let fullname : String = "James Bond"
let informalGreeting = "Hi, \(nickname ?? fullname)"

// switch语句类型不止局限于Integer，String类型也可以，默认匹配到一个case，就不会再继续执行下面的代码了，所以不需要加break
// 必须要有default，区别于OC
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    // Is it a spicy red pepper?
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8,13],
    "Square": [1,4,9,16,25],
]

var largest = 0
// for循环遍历字典时候可以指定一对名字(kind，numbers)或者(_, numbers) 代替键值对，没有用到kind的时候可以用 _ 代替kind
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
// largest: 25
print("largest:",largest)

// while和repeat{...} while，与OC差不多，repeat类似OC的do，条件关键字while后面的 () 都是可以省略的
var n = 2
while n < 100 {
    n *= 2
}
// n: 128
print("n: \(n)")

var m = 2
repeat {
  m *= 2
} while m < 100
// m: 128
print("m:",m)

// 可以使用 ..< 表示一个范围，包含左边不包含右边的值，使用 ... 表示同时包含两边的值
var total = 0
for i in 2..<4 {
    total += i
}
// total: 5
print("total:",total)

/*=================================函数和闭包=================================*/
// 函数使用 -> 分割参数和返回值类型，可以在参数名前加上标签，可以使函数的可读性更好
// 不使用标签就用 “_”，这样子也不会使用参数名作为标签名了
func greet(_ person: String, on day: String) -> String {
    return "Hello, \(person), today is \(day)!"
}
// 不使用标签就默认使用参数名作为标签
// greet(person: "Tom", day: "Tuesday")
greet("Tom", on: "Tuesday")

// 元祖，可以返回多个数值，可以使用名字或者数字来查询元祖中某一个元素的值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [3,5,8,19,30,23])
// min: 3
print("min:",statistics.min)
// sum: 88
print("sum:",statistics.sum)
// sum: 88
print("sum:",statistics.2)

// 函数可以嵌套，并且里面的函数可以访问外面函数的局部变量，无参数的函数只需要写函数名加()，无返回值可以不用写 -> 以及后面的返回类型
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
// 15
returnFifteen()

// 函数的返回值可以是另一个函数
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 函数的参数也可以是一个函数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// 闭包，类似OC的block，in是分隔闭包体和前面的参数类型与返回值类型
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// 闭包可以更简洁，如果类型已知，可以省略参数类型、返回值类型或者都省略，单语句闭包会隐式的返回唯一语句执行的结果
let mappedNumbers = numbers.map({ number in 3 * number })
// mappedNumbers: [60, 57, 21, 36]
print("mappedNumbers:",mappedNumbers)

// 闭包的几种写法
let sortedNumbers1 = numbers.sorted(by: {(num1: Int, num2: Int) -> Bool in
    return num1 > num2
})
// 省略参数类型、返回值类型，单语句闭包隐式返回唯一语句执行的结果
let sortedNumbers2 = numbers.sorted(by: {(num1,num2) in num1 > num2})
// 可以用下标来代替参数名字
let sortedNumbers3 = numbers.sorted(by: {$0 > $1})
// 如果闭包是函数的唯一参数，可以把整个小括号()都省掉
let sortedNumbers4 = numbers.sorted { $0 > $1 }
// sortedNumbers4: [20, 19, 12, 7]
print("sortedNumbers4:", sortedNumbers4)

/*=================================对象和类=================================*/
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 类名加小括号创建类
var shape = Shape()
shape.numberOfSides = 7
let shapeDescription = shape.simpleDescription()

// init初始化函数
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
















































