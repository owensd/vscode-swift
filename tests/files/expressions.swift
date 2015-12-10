// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Expressions.html#//apple_ref/doc/uid/TP40014097-CH32-ID383

sum = try someThrowingFunction() + anotherThrowingFunction()   // try applies to both function calls
sum = try (someThrowingFunction() + anotherThrowingFunction()) // try apllies to both function calls
sum = (try someThrowingFunction()) + anotherThrowingFunction() // Error: try applies only to the first function call

(a, _, (b, c)) = ("test", 9.45, (12, 3))
// a is "test", b is 12, c is 3, and 9.45 is ignored

func f(any: Any) { print("Function for Any") }
func f(int: Int) { print("Function for Int") }
let x = 10
f(x)
// prints "Function for Int"
 
let y: Any = x
f(y)
// prints "Function for Any"
 
f(x as Any)
// prints "Function for Any"

func logFunctionName(string: String = __FUNCTION__) {
    print(string)
}
func myFunction() {
    logFunctionName() // Prints "myFunction()".
}
 
myFunction()
namedArgs(1, withJay: 2)

var emptyDictionary: [String: Double] = [:]

class SomeClass {
    var greeting: String
    init(greeting: String) {
        self.greeting = greeting
    }
}

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

myFunction {
    (x: Int, y: Int) -> Int in
    return x + y
}
 
myFunction {
    (x, y) in
    return x + y
}
 
myFunction { return $0 + $1 }
 
myFunction { $0 + $1 }

var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
}
 
a = 10
b = 10
closure()
// prints "0 10"

class SimpleClass {
    var value: Int = 0
}
var x = SimpleClass()
var y = SimpleClass()
let closure = { [x] in
    print(x.value, y.value)
}
 
x.value = 10
y.value = 10
closure()
// prints "10 10"

myFunction { print(self.title) }                    // strong capture
myFunction { [weak self] in print(self!.title) }    // weak capture
myFunction { [unowned self] in print(self.title) }  // unowned capture

myFunction { [weak parent = self.parent] in print(parent!.title) }

var x = MyEnumeration.SomeValue
x = .AnotherValue

(x, _) = (10, 20)

someFunction(x, f: {$0 == 13})
someFunction(x) {$0 == 13}

// someFunction takes a closure as its only argument
myData.someMethod() {$0 == 13}
myData.someMethod {$0 == 13}

class SomeSubClass: SomeSuperClass {
    override init() {
        // subclass initialization goes here
        super.init()
    }
}

// Type annotation is required because String has multiple initializers.
let initializer: Int -> String = String.init
let oneTwoThree = [1, 2, 3].map(initializer).reduce("", combine: +)
print(oneTwoThree)
// prints "123"

let s1 = SomeType.init(data: 3)  // Valid
let s2 = SomeType(data: 1)       // Also valid
 
let s4 = someValue.dynamicType(data: 5)       // Error
let s3 = someValue.dynamicType.init(data: 7)  // Valid

class SomeClass {
    var someProperty = 42
}
let c = SomeClass()
let y = c.someProperty  // Member access

var t = (10, 20, 30)
t.0 = t.1
// Now t is (20, 20, 30)

let x = [10, 3, 20, 15, 4]
    .sort()
    .filter { $0 > 5 }
    .map { $0 * 100 }
	
class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// someInstance has a static type of SomeBaseClass at compile time, and
// it has a dynamc type of SomeSubClass at runtime
someInstance.dynamicType.printClassName()
// prints "SomeSubClass"

var x: Int? = 0
x!++
// x is now 1
 
var someDictionary = ["a": [1, 2, 3], "b": [10, 20]]
someDictionary["a"]![0] = 100
// someDictionary is now ["b": [10, 20], "a": [100, 2, 3]]

var c: SomeClass?
var result: Bool? = c?.property.performAction()

var result: Bool? = nil
if let unwrappedC = c {
    result = unwrappedC.property.performAction()
}

func someFunctionWithSideEffects() -> Int {
    return 42  // No actual side effects.
}
var someDictionary = ["a": [1, 2, 3], "b": [10, 20]]
 
someDictionary["not here"]?[0] = someFunctionWithSideEffects()
// someFunctionWithSideEffects is not evaluated
// someDictionary is still ["b": [10, 20], "a": [1, 2, 3]]
 
someDictionary["a"]?[0] = someFunctionWithSideEffects()
// someFunctionWithSideEffects is evaluated and returns 42
// someDictionary is now ["b": [10, 20], "a": [42, 2, 3]]

