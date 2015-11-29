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

//对象和类

class Shape {
    let shapeColor:String? = nil
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func simpleColorDescription(color:String) -> String {
      return "A shape with \(numberOfSides) sides and shape color is \(shapeColor ?? color)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapeColorDescription = shape.simpleColorDescription("yellow")


class NamedShape {
    var numberOfSides:Int = 0
    var name:String
    
    init(name:String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
  var sideLength: Double = 0.0
  
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }
  
  func area() -> Double {
    return sideLength * sideLength
  }
  
  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
  var radius: Double
  
  init(radius: Double, name:String) {
    self.radius = radius
    super.init(name: name)
  }
  
  func area() -> Double {
    return radius * radius * M_PI
  }
  
  override func simpleDescription() -> String {
    return "A circle with area \(area())"
  }
}

let testCircle = Circle(radius: 2, name: "my test circle")
testCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
  var sideLenth: Double = 0.0
  
  init(sidelenth: Double, name: String) {
    self.sideLenth = sidelenth
    super.init(name: name)
    numberOfSides = 3
  }
  
  var perimeter: Double {
    get {
      return 3.0 * sideLenth
    }
    
    set {
      sideLenth = newValue/3.0
    }
  }
  
  override func simpleDescription() -> String {
    return "An equilateral triagle with sides og length \(sideLenth)."
  }
}

var triangle = EquilateralTriangle(sidelenth: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLenth)

class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLenth
    }
  }
  var square: Square {
    willSet {
      triangle.sideLenth = newValue.sideLength
    }
  }
  
  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sidelenth: size, name: name)
  }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLenth)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLenth)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


//枚举和结构体

enum Rank: Int {
  case Ace = 1
  case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
  case Jack, Queen, King
  func simpleDescription() -> String {
    switch self {
    case .Ace:
      return "ace"
    case .Jack:
      return "jack"
    case .Queen:
      return "queen"
    case .King:
      return "king"
    default:
      return String(self.rawValue)
    }
  }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
let jack = Rank.Jack
let jackRawValue = jack.rawValue

if let convertedRank = Rank(rawValue: 3) {
  let threeDescription = convertedRank.simpleDescription()
}

enum Suit: Int {
  case Spades, Hearts, Diamounds, Clubs
  func simpleDescription() -> String {
    switch self {
    case .Spades:
      return "spades"
    case .Hearts:
      return "hearts"
    case .Clubs:
      return "clubs"
    case .Diamounds:
      return "diamonds"
    }
  }
  func color() -> String {
    switch self {
    case .Spades, .Clubs:
      return "black"
    case .Hearts, .Diamounds:
      return "red"
    }
  }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heratsColor = hearts.color()

struct Card {
  var rank: Rank
  var suit: Suit
  var cardName: String
  var cardColor: String
  
  func simpleDescription() -> String {
    return "The \(suit.color()) \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
  
  func cards() -> [String] {
    var description: String
    var cardsDescription: [String] = []
    for i in 1...13 {
      let iRank = Rank(rawValue: i)
      for j in 0..<4 {
        let jSuit = Suit(rawValue: j)
        description = "The \(jSuit!.color()) \(iRank!.simpleDescription()) of \(jSuit!.simpleDescription())"
        cardsDescription.append(description)
      }
    }
    return cardsDescription
  }
  
  init(name:String, color: String, rank: Rank, suit: Suit){
    self.cardName = name
    self.cardColor = color
    self.rank = rank
    self.suit = suit
  }
}

let threeOfSpades = Card(name: "joke card", color: "blue", rank: .Six, suit: .Clubs)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
let cards = threeOfSpades.cards()

enum ServerResponse {
  case Result(String, String)
  case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
  let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
  let serverResponse = "Failure... \(error)";
}

//协议和扩展
protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

class SimpleClass: ExampleProtocol {
  var simpleDescription: String = "A very simple class."
  var anotherProperty: Int = 69105
  func adjust() {
    simpleDescription += "Now 100% adjusted."
  }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
  var simpleDescription: String = "A simple structure"
  mutating func adjust() {
    simpleDescription += " (adjusted)"
  }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//enum SimpleEnum: ExampleProtocol {
//  case carDescription(String,String)
//  case careWheel(String)
//  
//  var simpleDescription: String  = "A simple enum"
//  func adjust() {
//    
//  }
//}

extension Int: ExampleProtocol {
  var simpleDescription: String {
    return "The number \(self)"
  }
  mutating func adjust() {
    self += 42
  }
}
//let number = 7.adjust()
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

//泛型
func repeatItem <Item>(itemName item: Item, numberOfTimes: Int) -> [Item] {
  var result = [Item]()
  for _ in 0..<numberOfTimes {
    result.append(item)
  }
  return result
}
//repeatItem("knock", numberOfTimes: 4)
repeatItem(itemName: "knock", numberOfTimes: 4)

enum OptionalValue <Wrapped> {
  case None
  case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (Ihs: T, _ rhs: U) -> Bool {
  for IhsItem in Ihs {
    for rhsItem in rhs {
      if IhsItem == rhsItem {
        return true
      }
    }
  }
  return false
}
anyCommonElements([1, 2, 3], [4])



