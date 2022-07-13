import SwiftUI

struct ContentView: View {
    
    @State private var totalBill = 0.0
    @State private var nrPeople = 1
    @State private var tipPercentage = 0.0
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
