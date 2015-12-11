// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Types.html#//apple_ref/doc/uid/TP40014097-CH31-ID445

let someTuple: (Double, Double) = (3.14159, 2.71828)
func someFunction(a: Int) { /* ... */ }

typealias Point = (Int, Int)
let origin: Point = (0, 0)

var someValue: ExampleModule.MyType

let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArray: [String] = ["Alex", "Brian", "Dave"]

var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]

let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionary: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]

var optionalInteger: Int?
var optionalInteger: Optional<Int>

var implicitlyUnwrappedString: String!
var implicitlyUnwrappedString: ImplicitlyUnwrappedOptional<String>

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }

    convenience init() {}
    convenience de private init() {}
    private  convenience  init() {}
    
    mutating private func foo() {}
    override mutating private func foo() {}
    
    override nomutating private func foo() {}
}
let someInstance: SomeBaseClass = SomeSubClass()
// The compile-time type of someInstance is SomeBaseClass,
// and the runtime type of someInstance is SomeBaseClass
someInstance.dynamicType.printClassName()
// prints "SomeSubClass"

if someInstance.dynamicType === someInstance.self {
    print("The dynamic type of someInstance is SomeBaseCass")
} else {
    print("The dynamic type of someInstance isn't SomeBaseClass")
}
// prints "The dynamic type of someInstance isn't SomeBaseClass"

class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}
let metatype: AnotherSubClass.Type = AnotherSubClass.self
let anotherInstance = metatype.init(string: "some string")

let e = 2.71828 // The type of e is inferred to be Double.
let eFloat: Float = 2.71828 // The type of eFloat is Float.
