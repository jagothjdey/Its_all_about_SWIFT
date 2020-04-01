import SwiftUI
import Foundation

struct ContentView: View {
    
    init(){
        // call any method from below
        // computedProperties()
        // convertNumberFromString()
        // string()
        // closureMap()
        // callCaptureValuesFromHere()
        // callEscapingClosuresFromHere()
        // enumerations()
        // mutatingFunction()
        memorySafety()
    }
    
    var stepSize = 10
    
    func increment(_ number: inout Int) {
        number += stepSize
    }
    
    mutating func memorySafety(){
        increment(&stepSize)
        print(stepSize)
    }
    
    struct Rectangle {
        var width = 1
        var height = 1
        
        func area() -> Int {
            return width * height
        }
     
        mutating func scaleBy(value: Int) {
            width *= value
            height *= value
        }
    }
    
    func mutatingFunction(){
        var rect = Rectangle(width: 10, height: 10)
        rect.scaleBy(value: 2)
        print(rect.area())
    }
    
    struct Stack<Element> {
        var items = [Element]()
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop() -> Element {
            return items.removeLast()
        }
    }
    
    func enumerations(){
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        print(evaluate(product))
    }
    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    enum CompassPoint : String{
        case north
        case south
        case east
        case west
    }
    
    func callEscapingClosuresFromHere(){
        var completionHandlers: [() -> Void] = []
        func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
            completionHandlers.append(completionHandler)
            print("hd")
        }
    }
    
    
    func callCaptureValuesFromHere(){
        let incrementBySeven = capturingValues(forIncrement: 7)
        print(incrementBySeven())
        print(incrementBySeven())
        let incrementByTen = capturingValues(forIncrement: 10)
        print(incrementByTen())
        print(incrementByTen())
    }
    
    
    func capturingValues(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    func closureMap(){
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        print(strings)
    }
    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 < s2
    }
    
    
    func string(){
        let words = ["apple", "orange", "banana"]
        let str = words.joined(separator: " & ")
        print(str) // "apple & orange & banan
    }
    
    func convertNumberFromString(){
        print(String(1635999)) // returns "1635999"
        print(String(1635999, radix: 2)) // returns "1635999"
        String(1635999, radix: 2) // returns "110001111011010011111"
        String(1635999, radix: 16) // returns "18f69f"
        String(1635999, radix: 16, uppercase: true) // returns "18F69F"
        String(1635999, radix: 17) // returns "129gf4"
        String(1635999, radix: 36) // returns "z2cf"
    }
    
    func propertyObserver(){
        var myProperty = 5 {
            willSet {
                print("1")
                print("Will set to \(newValue). It was previously \(myProperty)")
            }
            didSet {
                print("2")
                print("Did set to \(myProperty). It was previously \(oldValue)")
            }
        }
        myProperty = 6
    }
    
    func  computedProperties(){
        let circle = Circle()
        circle.radius = 1
        print(circle.circumference) // Prints "6.28"
        circle.circumference = 14
        print(circle.radius) // Prints "2.229..."
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

var pi = 3.14

class Circle {
    var radius = 0.0
    var circumference: Double {
        get {
            return pi * radius * 2
        }
        set {
            print("Newvalue : \(newValue)")
            radius = newValue / pi / 2
        }
    }
}
