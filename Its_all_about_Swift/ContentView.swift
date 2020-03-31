import SwiftUI

struct ContentView: View {
    
    init(){
        // call any method from below
        // computedProperties()
        //convertNumberFromString()
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
