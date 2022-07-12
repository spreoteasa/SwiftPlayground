//import Foundation

import Darwin
//////
//////let action = {
//////    print("Am doing smth")
//////}
//////
//////
//////action()
//////
//////
//////
//////let actionWithArguments = {
//////    (action: String) in
//////    print("I am doing \(action)")
//////}
//////
//////actionWithArguments("meth")
//////
//////
//////let actionWithReturnValue = {
//////    (action: String) -> String
//////    in
//////    return "I am doing \(action)"
//////}
//////
//////print(actionWithReturnValue("meth too"))
//////
//////func functionWithActionArgument(action : (String) -> String){
//////    print("I am trying to do smth")
//////    print(action("meth"))
//////    let dun = action("meth")
//////    print("Done with \"\(dun)\"")
//////}
//////
//////functionWithActionArgument(action:actionWithReturnValue)
//////
//////
//////func functionWithTrailingClosure(action: () -> Void){
//////    print("This is smth smth gud gud")
//////    action()
//////    print("Done with doing the smth smth gud gud")
//////}
//////
//////functionWithTrailingClosure() {
//////    print("haha function go brrrr")
//////}
//////
//////func functionWithShorthandParameter(action: (String) -> String){
//////    print("I am doing smth")
//////    let description = action("Action")
//////    print(description)
//////    print("Brrrr")
//////}
//////
//////functionWithShorthandParameter(action: actionWithReturnValue)
//////
//////func multipleParameters(action: (String, Int) -> String){
//////    let description = action("Dabuleni", 10)
//////    print(description)
//////}
//////
//////multipleParameters{
//////    "I am going to \($0) to buy \($1) pepeni"
//////}
//////
//////
//////func example() -> (String) -> Void{
//////    return {
//////        print("I am going to \($0)")
//////    }
//////}
//////
//////
//////let result = example()("Focsani")
////
////
////
////
////var dogs: [Dog] = []
////
////struct Dog{
////    var name: String
////}
////
////var grivei = Dog(name: "Grivei")
////for _ in 0...100{
////    dogs.append(grivei)
////}
////
////
////func stringRepeater(word: String, timesRepeated: Int) -> String{
////    var x = ""
////    for _ in 0...timesRepeated{
////        x.append(word)
////    }
////
////    return x;
////}
////
//////for (index, dog) in dogs.enumerated(){
//////    var value = stringRepeater(word: dog.name, timesRepeated: index)
//////    print("This \(dog.name) is the number \(index)")
//////    print(value)
//////
//////}
////
////
////struct Progress{
////    var task: String
////    var percentile: Int{
////        didSet{
////            print("\(task) is \(percentile)% done")
////        }
////    }
////
////    func isDone() -> Bool{
////        return self.percentile == 100
////    }
////}
////
////var progress = Progress(task: "Sleeping", percentile: 0)
////progress.percentile = 30
////progress.percentile = 50
////progress.percentile = 70
////progress.percentile = 90
//////progress.percentile = 100
////
////if(progress.isDone()){
////    print("Gata tata")
////}
////else{
////    print("Mai e de lucru Gionutzule")
////}
////
////
////struct Dood{
////    var name: String
////
////    mutating func changeName(_name: String) -> Void{
////        name = _name
////    }
////}
////
////
////var dood = Dood(name: "Gigi Becali")
////print(dood.name)
////
////dood.changeName(_name: "Ion Smecheru")
////print(dood.name.lowercased().sorted())
////
////struct SmthWithInit{
////    var name: String
////
////    init(_name: String){
////        if(_name != ""){
////            name = _name}
////        else{
////            name = "dadadada"}
////        print(name)
////    }
////}
////
////
////var a = SmthWithInit(_name: "")
////var b = SmthWithInit(_name: "Ion Smekeru")
////
////
////struct FamilyTree{
////    init(){
////        print("Created family tree!")
////    }
////}
////
////struct Person{
////    var name: String
////    lazy var famTree = FamilyTree()
////    static var population = 0
////
////    init(name: String){
////        self.name = name
////        print("Created person called \(name)")
////        Person.population += 1
////    }
////}
////
////
////var ed = Person(name: "Gigi")
////
////var ed1 = Person(name: "Gigi")
////var ed2 = Person(name: "Gigi")
////var ed3 = Person(name: "Gigi")
////var ed4 = Person(name: "Gigi")
////
////print(Person.population)
//////lazy var familyTree = FamilyTree()
////
//////ed.famTree
////
////
//
//
//class Animal{
//    var sound: String
//
//    init(sound: String){
//        self.sound = sound
//    }
//
//    func makeSound(){
//        print("\(self.sound)")
//    }
//}
//
//final class Dog: Animal{
//    let name: String
//    init(sound: String, name: String){
//        self.name = name
//        super.init(sound:sound)
////        self.name = name
//    }
//
//    override func makeSound(){
//        print("This dog goes \(self.sound)")
//    }
//
//    public var description: String{
//        return "Dog name is: \(self.name) and it goes: \(self.sound)"
//    }
//
//    deinit{
//        print("Sad \(self.sound)")
//    }
//}
//
//
//
//
//var mitzi = Animal(sound: "Mweow")
//let cutzu = Dog(sound: "Wuouf",name:"Grivei")
//mitzi.makeSound()
//cutzu.sound = "urit frate dc nu imi dai o tzigare"
//cutzu.makeSound()
//
//for _ in 1...3{
//    let x = Dog(sound: "wakawaka", name: "Hepi")
//}
//
//
//
//protocol Interface{
//    func doSmthOne() -> Void
//    func doSmthTwo() -> Interface
//}
//
//class Icsulescu : Interface{
//    func doSmthOne() {
//        print("One")
//    }
//
//    func doSmthTwo() -> Interface {
//        return Interface.self as! Interface
//    }
//
//
//}
//
//var quote = """
//                    This is smth
//that i do
//lalalala
//    skjdnfskdnf
// dffg do            n   n    n
//"""
//print(quote)
//extension String{
//    func trimmed() -> String{
////        self.replacingOccurrences(of:"\\n", with: " ")
//        self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//    }
//}
//
//print(quote.trimmed())
//
//
//struct Book{
//    var title: String
//    var price: Double
//    var author: String
//
//    init(title: String, price: Double, author: String){
//        self.title = title
//        self.price = price
//        self.author = author
//    }
//}
//
//extension Book{
//    init(title: String, price: Double)
//    {
//        self.title = title
//        self.price = price
//        self.author = "Unknown"
//    }
//}
//
//
//var b1 = Book(title: "Ion", price: 123.4, author: "Gica Petrescu")
//var b2 = Book(title: "Fata babei si boabele din club", price: 4.20)
//
//
//class Bookz{
//    var title: String
//    var price: Double
//    var author: String
//
//    init(title: String, price: Double, author: String){
//        self.title = title
//        self.price = price
//        self.author = author
//    }
//
//    convenience init(disparutaDePeFataPamantului tag: String){
//        self.init(title:tag, price: 720, author: tag)
//    }
//}
//
//
//var bz1 = Bookz(title:"a", price: 123.2222, author: "jhsbdjdfbsjdbf")
//var bz2 = Bookz(disparutaDePeFataPamantului: "Unknown")
//
//print(bz2.title)
//
//
//extension Numeric{
//    func squared() -> Self{
//        self * self
//    }
//}
//
//
//var x = 7.0129
//print(x.squared().squared().squared().squared())
//
//
//print(([1,2] + [-1,0]).sorted() )
//
//func &(x: String, y: String){
//    print("\(x) ii langa \(y)")
//}
//
//print("ionescu" & "popescu")
//
//



protocol Building{
    var nrRooms: Int { get set}
    var cost: Int { get set}
    var estateAgent: String {get set}
    
    func summary() -> Void
    
}

extension Building{
    func summary() ->  Void{
        print(
        """
House:
-> Rooms: \(self.nrRooms)
-> Price: \(self.cost)
-> Responsible estate agent: \(self.estateAgent)
"""
        )
    }
}


struct House : Building{
    var nrRooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office : Building{
    var nrRooms: Int
    var cost: Int
    var estateAgent: String
}


var h = House(nrRooms: 10, cost: 123, estateAgent: "Ion smekeru")
var o = Office(nrRooms: 4, cost: 12314, estateAgent: "Cechi-Cean")

h.summary()
o.summary()



var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

//guard let unwrapped2 = myVar else {
//    print("Run if myVar does not have a value inside")
//    return
//}
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of:1234)

import SwiftUI
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
