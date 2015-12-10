/*
 This is a representative syntax file for Swift.
 
 NOTE: This file is up-to-date with the Swift 2.0 syntax.
 */


/// ----- WHITESPACE AND COMMENTS ------

// See: https://developer.apple.com/library/ios/documentation/Xcode/Reference/xcode_markup_formatting_ref/GeneralMarkupSyntax.html#//apple_ref/doc/uid/TP40016497-CH52-SW1


//: # This is a Level 1 Heading

//: This is a Level 1 Heading
//: =========================

//: [Next Topic](@next)

/*:
1. Brazil
2. Vietnam
3. Colombia
*/

//: ## Points to Remember
//: * Empty lines end the single line comment delimiter rich text block
//: * Comment content ends at a newline
//: * Any commands that work in a comment block work in single line
//:     * This **includes** text formatting commands

/*:
## Why Comment Blocks
* Useful for many lines of content
* Prevent accidentally missing the single line delimiter
*/

/// - parameter llamas: The number of llamas in the herd.

/// Some description
///
/// - author: Your name goes here
///
/// More description
///
/// - returns: A static string

/**
- parameters:
  - string1: this is the first string.
  - string2: this is the second string.
*/

/**
 Another description
 
 - important: Make sure you read this
 
 - parameter anInt: The number of times to cheer
 */
 
 /**
Some description
 
- important: Shows correctly
 
    - important: Shows as an outline item
*/

/**
*A description field*
 
- complexity: O(1)
    becasue the method is empty. You could
    potentially call this constant time.
 
- returns: Nothing
    exept on Fridays when it returns everything
*/

/**
- parameters:
  - first: The first parameter
    documented on multiple lines
 
  - second:
    The second parameter on one line
*/

/**
 Errors thrown by fakeArray.
 
 *Values*
 
 `NegativeCount` The count is less than 0.
 
 `EmptyString1` The first string argument is empty.
 
 `EmptyString2` The second string argument is empty.
 
 - Author:
     Newbie
 - Version:
     0.1
 */
 
 /**
*A description field*
- important: This is
  a way to get the
  readers attention for
  something.
 
- returns: Nothing
 
*Another description field*
- version: 1.0
*/

/*: A block quote from Aesop's Fables
The Swallow and the Crow
 
> The Swallow and the Crow had a contention about their plumage.
> The Crow put an end to the dispute by saying,
> "Your feathers are all very well in the spring,
> but mine protect me against the winter."
 
by Aesop
*/

/*: A bulleted list of 2 items
* Item 1
* Item 2
*/

/*: A loop to print each character on a seperate line
    for character in "Aesop" {
        println(character)
    }
*/

/**
An example of using a *code block*
 
A loop to print each character on a seperate line
 
    for character in "Aesop" {
        println(character)}
    }
*/

/**
An example of using a *code block*
 
A loop to print each character on a seperate line
````
for character in "Aesop" {
println(character)}
}
````
*/

//: ## This is a Heading 2

/**
An example of using a number sign (`#`) for a *heading*
 
## This is a Heading 2
*/

//: This is a Heading 1
//: ===================


/**
An example of using a character underline for a *heading*
 
This is a Heading 1
===================
*/

/*: A block of markup code showing a single horizontal line
 
----
 
*/

/**
An example of using a *horizontal rule*
 
This text is above the horizontal rule
 
----
 
And this is below
*/

/*: Setup and use a link reference.
[The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
For light reading we suggest [The Swift Programming Language].
 
For more information, see [The Swift Programming Language].
 
If you are not sure, please see [The Swift Programming Language].
*/

/**
An example of using a *link reference*
 
[The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
For light summer reading we suggest [The Swift Programming Language].
 
### Useful books
* [The Swift Programming Language]
*/

/*: A numbered list with 2 levels
1. Cat
2. Dog
    1. Golden Retriever
3. Llama
*/

/**
An example of using a *numbered list*
 
1. Cat
2. Dog
    1. Golden Retriever
3. Llama
*/

/*: Start the numbering of the rich text list at "4"
4. Fish
5. Lizard
*/

//: Show Swift elements such as `for` and `let` as monspaced code font

/**
An example of using a *code voice*
 
Show Swift elements such as `for` and `let` as monspaced code font
*/

/*: Do not show the first line as a bullet item
\* This is not a bullet item
* This is a bullet item
*/

/**
A simple example of using *display delimiter*
 
Do not show the first line as a bullet item
 
\* This is not a bullet item
 
* This is a bullet item
*/

/*: Display the single-line delimiter in the rendered playground
//\: This is how to write a single line of playground markup
*/

//: Show the *middle asterisk\* with emphasis*

/**
Display a special character with formatting
 
Show the *middle asterisk\* with emphasis*
*/

//: This line has a word with *emphasis*.
 
//: This line uses _emphasis for the last six words_.

/// This line has a word with *emphasis*.
///
/// This line uses _emphasis for the last six words_.

//: ![Icon for a playground](http://devimages.apple.com.edgekey.net/swift/images/playgrounds.png "An image I seesawed")

/**
An example of using *images* to display a web image
 
![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")
 
*/

//: ![The real head of the household?](cat.jpg)

/*: Include a link to the Swift page in the text
See more about Swift by [following this link.](http://developer.apple.com/swift/)
*/

/**
An example of using the seealso field
 
- seealso:
[The Swift Standard Library Reference](https://developer.apple.com/library/prerelease/ios//documentation/General/Reference/SwiftStandardLibraryReference/index.html)
*/

//: A **strong * (asterisk)** is on this line.
 
//: __A strong line__.

/**
An example of using *strong*
 
A **strong * (asterisk)** is on this line.
 
__A strong line__.
*/

//: [Overview of Building Tutorials](Tutorial%20Building%20Overview)

//: [Next Topic](@next)

//: [Previous Topic](@previous)

/// - parameter llamaCount: The number of llamas in the managed herd.

/**
- parameters:
  - cubes: The cubes available for allocation
  - people: The people that require cubes
*/

/// - returns: A random number between `min` and `max`

/// - throws: An error of type `FakeArrayError`

/**
An example of using the attention field
 
- attention: What I if told you
you read this line wrong?
*/

/**
An example of using the author field
 
- author: William Shakespeare
*/

/**
An example of using the authors field
 
- authors:
  Plato
 
  Aristotle
 
  Other amazing
  classical folk
*/

/**
An example of using the bug field
 
- bug:
[*bugExample* contains a memory leak](BugDB://problem/1367823)
 
- bug:
[Passing a `UIViewController` crashes *bugExample*](BugDB://problem/2274610)
*/

/**
An example of using the complexity field
 
- complexity:
The method demonstrates an inefficient way to sort
using an O(N\*N\*N) (order N-cubed) algorithm
*/

/**
An example of using the copyright field
 
- copyright: Copyright © 1215
by The Group of Barrons
*/

/**
An example of using the date field
 
Last date this example was changed
- date: August 19, 2015
 
Days the method produces special results
- date: 12/31
- date: 03/17
*/

/**
An example of using the experiment field
 
- experiment: Pass in a string in the present tense
- experiment: Pass in a string with no vowels
- experiment:
Change the third case statement to work only with consonants
*/

/**
An example of using the important field
 
- important:
"The beginning is the most important part of the work."
\
–Plato
*/

/**
An example of using the invariant field
 
- invariant:
The person reference will not change during the execution of this method
*/

/**
An example of using the note field
 
- note:
This method returns an estimate.
Use `reallyAccurateReading` to get the best results.
*/

/**
An example of using the precondition field
 
- precondition: The `person` property must be non-nil.
- precondition: `updatedAddress` must be a valid address.
*/

/**
An example of using the postcondition field
 
- postcondition:
After completing this method the billing address for
the person will be set to `updatedAddress` if it is valid.
Otherwise the billing address will not be changed.
*/

/**
An example of using the remark field
 
- remark:
The performance could be reduced from N-squared to
N-log-N by switching patterns.
*/

/**
An example of using the requires field
 
- requires: Contacts framework
- requires: OS X version 10.11 or better
*/

/**
An example of using the seealso field
 
- seealso:
[The Swift Standard Library Reference](https://developer.apple.com/library/prerelease/ios//documentation/General/Reference/SwiftStandardLibraryReference/index.html)
*/

/**
An example of using the since field
 
- since: First available in Mac OS 7
*/

/**
An example of using the todo field
 
- todo: Run code coverage and add tests
*/

/**
An example of using the todo field
 
- todo: Run code coverage and add tests
*/

/**
An example of using the warning field
 
- warning:
Not all code paths for this method have been tested
*/


/// ----- IDENTIFIERS -----

func _asdv() {}
func sdf12335() {}
func d21235_DFKLJEFA_1234____123_() {}

// tool: http://r12a.github.io/apps/conversion/
// identifier-head → U+00A8, U+00AA, U+00AD, U+00AF, U+00B2–U+00B5, or U+00B7–U+00BA

func ¨() {}
func ª() {}
func ¯() {}
func ²() {}
func ³() {}
func ´() {}
func µ() {}
func ·() {}
func ¸() {}
func ¹() {}
func º() {}

// identifier-head → U+00BC–U+00BE, U+00C0–U+00D6, U+00D8–U+00F6, or U+00F8–U+00FF

let ¼ = 0.25
let ½ = 0.5
let ¾ = 0.75
let À = "À"
let Ç = "Ç"
let Ö = "Ö"
let Ø = "Ø"
let à = "à"
let ð = "ð"
let ö = "ö"
let ø = ö
let ú = ø
let ÿ = ú

// identifier-head → U+0100–U+02FF, U+0370–U+167F, U+1681–U+180D, or U+180F–U+1DBF

struct Ā {}
struct ˿{}
struct Ͱ {}
struct ᙿ{}
struct ᚁ{}
struct ᠏{}
struct ᶿ {}

// identifier-head → U+1E00–U+1FFF

class Ḁ {}
class ờ {}
class ῿ {}

// identifier-head → U+200B–U+200D, U+202A–U+202E, U+203F–U+2040, U+2054, or U+2060–U+206F
// NOTE: Some errors within this range even in Xcode

let ​ = ""
let ‌ = ""
let ‍ = ""
let ‿ = ""
let ⁀ = ""
let ⁔ = ""
let ⁠ = ""

// identifier-head → U+2070–U+20CF, U+2100–U+218F, U+2460–U+24FF, or U+2776–U+2793

let ⁰ = 0
let ⃏ = 1
let ℀ = 3
let ↏ = 4
let ① = 5
let ⓿ = 6
let ❶ = 7
let ➓ = 8

// identifier-head → U+2C00–U+2DFF or U+2E80–U+2FFF

struct Ⰰ {}
struct ⷿ {}
struct ⺀ {}
struct ⿿ {}

// identifier-head → U+3004–U+3007, U+3021–U+302F, U+3031–U+303F, or U+3040–U+D7FF

func 〄(〇: Int, 〡: Int, 〯: Int, 〱: Int, 〿: Int, ぀: Int, ퟿: Int) {}

// identifier-head → U+F900–U+FD3D, U+FD40–U+FDCF, U+FDF0–U+FE1F, or U+FE30–U+FE44

func 豈(ﴽ: String, ﵀: String, ﷏: String, ﷰ: String, ︟: String, ︰: String, ﹄: String) {}

// identifier-head → U+FE47–U+FFFD
// NOTE: The end range failed in Xcode...

let ﹇ = true

// identifier-head → U+10000–U+1FFFD, U+20000–U+2FFFD, U+30000–U+3FFFD, or U+40000–U+4FFFD

struct 𐀀 {}
struct 🿽 {}
struct 𠀀 {}
struct 𯿽 {}
struct 𰀀 {}
struct 𿿽 {}
struct 񀀀 {}
struct 񏿽 {}

// identifier-head → U+50000–U+5FFFD, U+60000–U+6FFFD, U+70000–U+7FFFD, or U+80000–U+8FFFD

class 񐀀 {}
class 񟿽 {}
class 񠀀 {}
class 񯿽 {}
class 񰀀 {}
class 񿿽 {}
class 򀀀 {}
class 򏿽 {}

// identifier-head → U+90000–U+9FFFD, U+A0000–U+AFFFD, U+B0000–U+BFFFD, or U+C0000–U+CFFFD

func 򐀀() {}
func 򟿽() {}
func 򠀀() {}
func 򯿽() {}
func 򰀀() {}
func 򿿽() {}
func 󀀀() {}
func 󏿽() {}

// identifier-head → U+D0000–U+DFFFD or U+E0000–U+EFFFD

func 󐀀(󟿽: Double, 󠀀: Double, 󯿽: Double) {}

// identifier-character → U+0300–U+036F, U+1DC0–U+1DFF, U+20D0–U+20FF, or U+FE20–U+FE2F
let ̀ = true

let ͯ = true
let ᷀ = true
let ᷿ = true
let ⃐ = true
let ⃿ = true
let ︠ = true
let ︯ = true

/// ----- KEYWORDS AND PUNCTUATION -----

let `class` = ""
let `deinit` = ""
let `enum` = ""
let `extension` = ""
let `func` = ""
let `import` = ""
let `init` = ""
let `inout` = ""
let `internal` = ""
let `let` = ""
let `operator` = ""
let `private` = ""
let `protocol` = ""
let `public` = ""
let `static` = ""
let `struct` = ""
let `subscript` = ""
let `typealias` = ""
let `var` = ""
let `break` = ""
let `case` = ""
let `continue` = ""
let `default` = ""
let `defer` = ""
let `do` = ""
let `else` = ""
let `fallthrough` = ""
let `for` = ""
let `guard` = ""
let `if` = ""
let `in` = ""
let `repeat` = ""
let `return` = ""
let `switch` = ""
let `where` = ""
let `while` = ""
let `as` = ""
let `catch` = ""
let `dynamicType` = ""
let `false` = ""
let `is` = ""
let `nil` = ""
let `rethrows` = ""
let `super` = ""
let `self` = ""
let `Self` = ""
let `throw` = ""
let `throws` = ""
let `true` = ""
let `try` = ""
let `__COLUMN__` = ""
let `__FILE__` = ""
let `__FUNCTION__` = ""
let `__LINE__` = ""

let associativity = ""
let convenience = ""
let dynamic = ""
let didSet = ""
let final = ""
let get = ""
let infix = ""
let indirect = ""
let lazy = ""
let left = ""
let mutating = ""
let none = ""
let nonmutating = ""
let optional = ""
let override = ""
let postfix = ""
let precedence = ""
let prefix = ""
let Protocol = ""
let required = ""
let right = ""
let set = ""
let Type = ""
let unowned = ""
let weak = ""
let willSet = ""


/// ----- LITERALS -----

let binary = 0b00101
let octal = 0o000732
let decimal = 10234
let hexadecimal = 0xafeFE82F

let f1 = 125
let f2 = 1.25e2
let f3 = 1250E-1

let h1 = 0xFp-2
let h2 = 0xFAP2

let v1 = -125_134
let v2 = +123_928
let v3 = 0xFF_DB_00
let v4 = 0o01_07
let v5 = 0b00_01_11

let string = "Just a normal string"
let expressionString = "1 + 2 = \(1 + 2)"
let interpolatedString = "The value is: \(h1)"
let escapedString = "Hello\nNewline\tTab\rCarriageReturn\"Quote\'SingleQuote\\Slash\0Null\u01234"


/// ----- OPERATORS -----

infix operator ¡ {}
infix operator § {}
infix operator © {}
infix operator « {}
infix operator ¬  {}
infix operator ® {}
infix operator ° {}
infix operator ± {}
infix operator ¶ {}
infix operator » {}
infix operator ¿ {}
infix operator × {}
infix operator ÷ {}
infix operator ‖ {}
infix operator ‗  {}
infix operator † {}
infix operator ‧ {}
infix operator ‰ {}
infix operator ‾ {}
infix operator ⁁ {}
infix operator ⁓ {}
infix operator ⁕ {}
infix operator ⁞ {}
infix operator ← {}
infix operator ⏿ {}
infix operator ─ {}
infix operator ❵ {}
infix operator ➔ {}
infix operator ⯿ {}
infix operator ⸀ {}
infix operator ⹿ {}
infix operator 、 {}
infix operator 〃 {}
infix operator 〈 {}
infix operator 〰 {}

infix operator ©̀ {}
infix operator ©ͯ {}
infix operator ©᷀ {}
infix operator ©᷿ {}
infix operator ©⃐ {}
infix operator ©⃿ {}
infix operator ©︀ {}
infix operator ©️ {}
infix operator ©︠ {}
infix operator ©︯ {}
infix operator ©󠄀 {}
infix operator ©󠇯 {}

infix operator .... {}

postfix    operator   { associativity     right }
infix    operator   { associativity     none }
postfix    operator   { associativity     left }

infix     operator   {  precedence 250  associativity   left }

