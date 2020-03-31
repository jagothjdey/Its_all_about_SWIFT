import SwiftUI

struct ContentView: View {
    
    init(){
        //propertyObserver()
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
    
    var body: some View {
        Text("Hello, World!")
    }
}
