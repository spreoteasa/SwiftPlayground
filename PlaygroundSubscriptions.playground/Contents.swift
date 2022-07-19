import UIKit
import Darwin

var greeting = "Hello, playground"


struct SomeComputation{
    var randomNumber = 10
    subscript(value: Int) -> Int{
        return value * self.randomNumber
    }
}
var a = SomeComputation()

print(a[10])
