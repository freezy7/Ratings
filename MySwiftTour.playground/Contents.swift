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
for i in 0 ..< 4 {
    secondForLoop += i
}
print(secondForLoop)

/**
*  函数和闭包
*/

func greet(_ name:String, day:String) -> String {
    return "Hello \(name), today is \(day)"
}

print(greet("Bob", day: "Friday"))

func calculateStatistics(_ scores:[Int]) -> (min:Int, max:Int, sum:Int) {
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

//可变参数
func avangeOf(_ numbers:Int...) -> Int {
    var avange = 0
    var sum = 0
    for num in numbers {
        sum += num
    }
    avange = sum/numbers.count
    return avange
}

print(avangeOf(1,2,3,4,5,6))

func makeIncrementr() -> ((Int)->Int) {
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementr()
print(increment(7))

func hasAnyMatches(_ list:[Int], condition:(Int) -> Bool) -> Bool {
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

numbers.map{
    5*$0
}

numbers.flatMap{
    $0*6
}

let mappedNumbers = numbers.map({number in 3*number})
print(mappedNumbers)

let sortedNumbers = numbers.sort{$0 > $1}
print(sortedNumbers)

class Person {
    var age: Int = 0
    let sex: Bool = true
//    init(){
//        self.age = 30
//        self.sex = false
//    }
//    init(withAge age:Int, sex:Bool) {
//        self.age = age
//        self.sex = sex
//    }
}

let ducong = Person()
//ducong.age = 35
//print(ducong.age)

//var ducongcong = Person(withAge: 40, sex: false)

struct Dog {
    var age:Int = 0
    let sex:Bool
}

let dog = Dog(age: 40, sex: true)
//
class SurveyQusetion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQusetion(text: "Do you like cheese ?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, Ido like cheese"
print(cheeseQuestion.response!)

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init (){}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init (center: Point, size: Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x: originX, y: originY), size:size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5, height: 5))

let centerRect = Rect(center: Point(x: 4, y: 4), size: Size(width: 3, height: 3))

let twoByTwo = Size(width: 2.0, height: 2.0)

/**
*  类的构造器代理规则
*  1、指定构造器必须调用其直接父类的指定构造器
*  2、便利构造器必须调用同一类中定义的其他构造器
*  3、便利构造器必须最终调用一个指定构造器结束
*  指定构造器必须总是向上代理，便利构造器总是横向代理
*
 * 子类不会默认继承父类的构造器，但是如果条件可以满足，父类构造器是可以被自动继承的（自动构造器的继承）
 *  1、如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器
 *  2、如果子类提供了所有父类指定构造器的实现--不管是通过规则1继承过来的，还是通过自定义实现的--他将自动继承所有的父类便利构造器
 *  即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。
 *  注意： 子类可以通过部分满足规则2的方式，使用子类便利构造器来实现父类的指定构造器
*/

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
vehicle.numberOfWheels = 3
print(vehicle.description)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle:\(bicycle.description)")

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name:"[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name)

let mysteryMeat = Food()
print(mysteryMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity:1)
    }
}

let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.quantity)
let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.quantity)
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name)


class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "√":"×"
        return output
    }
}

var breakfastlist = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastlist[0].name = "Orange juice"
breakfastlist[0].purchased = true

print(breakfastlist[0].description)
print(breakfastlist[1].description)
print(breakfastlist[2].description)


//:Mark------

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//枚举类型的可失败构造器

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
                self = .Kelvin
            case "C":
                self = .Celsius
            case "F":
                self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined tempeture unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if  unknownUnit == nil {
    print("This is not a defined temouture unit, so initialization failed.")
}

//带原始值的枚举类型的可失败构造器

enum TemperatureUnits: Character {
    case Kevin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheit = TemperatureUnits(rawValue: "F")
let unknownUnits = TemperatureUnits(rawValue: "X")

//类的可失败构造器

class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty {return nil}
    }
}

if let bowTie = Product(name: "bow tie") {
    print("The product's name is \(bowTie.name)")
}

//构造失败的传递

class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 {return nil}
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("item:\(twoSocks.name), quantity:\(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("item:\(zeroShirts.name), quantity:\(zeroShirts.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

let oneUnnamed = CartItem(name: "", quantity: 1)

//重写一个可失败构造器

class Document {
    var name: String?
    init(){}
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "Untitled"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}


let unDoc = UntitledDocument()
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
var shapeColorDescription = shape.simpleColorDescription(color: "yellow")


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

//import Sequence

//泛型

func anyCommonElements <T: Sequence, U: Sequence> (_ Ihs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
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



