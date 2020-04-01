import SwiftUI
import Foundation

struct ContentView: View {
    init(){
        // call any method from below
        // computedProperties()
        // convertNumberFromString()
        // string()
        // closureMap
        
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
