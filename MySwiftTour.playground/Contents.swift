//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("hello,world")

//简单值

var myVarliable = 42
myVarliable = 50
myVarliable = 42

let implicitInteger = 70
let implicitDouble = 50.0
let explicitDouble: Double = 70
let floatNum: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let orangeSummary = "I have \(oranges) oranges"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print(shoppingList)

var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"mechanic"
]
occupations["jayne"] = "Public Relations"
print(occupations)

let emptyArray = [String]()
let emptuDictionary = [String:Float]()

shoppingList = []
occupations = [:]

//控制流
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "name is nil"
}
print(greeting)

let nickName: String? = "ducong"
let fullName: String = "John Appleseed"
let informalGreeting = "Hi, \(nickName ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log")
    case "cucumber","watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime":[2, 3, 5, 7, 11, 13],
    "Fibonacci":[1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25],
]
var lagest = 0
var lagestType: String? = nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > lagest {
            lagest = number
            lagestType = kind
        }
    }
}
print("lagest number is \(lagest) and type is  \(lagestType!)")

var n = 2
while n < 100 {
    n = n*2
}
print(n)

var m = 2
repeat {
    m = m*2
} while m < 100
print(m)


var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print(secondForLoop)

/**
*  函数和闭包
*/

func greet(name:String, day:String) -> String {
    return "Hello \(name), today is \(day)"
}

print(greet("Bob", day: "Friday"))

func calculateStatistics(scores:[Int]) -> (min:Int, max:Int, sum:Int) {
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

let statistics = calculateStatistics([5, 3, 3, 5, 6, 100, 0, 1])
print(statistics.sum)
print(statistics.max)
print(statistics.1)

func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

func avangeOf(numbers:Int...) -> Int {
    var avange = 0
    var sum = 0
    for num in numbers {
        sum += num
    }
    avange = sum/numbers.count
    return avange
}

print(avangeOf(1,2,3,4,5,6))

func makeIncrementr() -> (Int->Int) {
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementr()
print(increment(7))

func hasAnyMatches(list:[Int], condition:Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 11, 12]
print(hasAnyMatches(numbers, condition: lessThanTen))


numbers.map({
    (number:Int) -> Int in
    let result = 3*number
    return result
})

let mappedNumbers = numbers.map({number in 3*number})
print(mappedNumbers)

let sortedNumbers = numbers.sort{$0 > $1}
print(sortedNumbers)





