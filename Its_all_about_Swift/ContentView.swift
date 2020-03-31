import SwiftUI

struct ContentView: View {
    
    init(){
        // call any method from below
        computedProperties()
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
