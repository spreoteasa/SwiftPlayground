import SwiftUI

struct ContentView: View {
    
    @State var nrPeople: Int = 1
    @State var price: Double = 0.0
    @State var tips: Int = 0
    @State var showAlert: Bool = false
    let tipPercentages = [0,5,10,15,25]
    var bill: Bill = Bill()
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Text("How much was the bill?")
                    TextField("Insert how much the bill will cost",value: $price,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                Section{
                    Text("How many of people are splitting the bill?")
                    Picker("Number of people", selection: $nrPeople){
                        ForEach(2..<100){
                            Text("\($0)")
                        }
                    }
                }
                Section{
                    Text("How much do you want to tip?")
                    Picker("Tip percentage", selection: $tips){
                        ForEach(tipPercentages, id: \.self){ tip in
                            Text(tip,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Split.io")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        Button("Compute"){
            self.bill.setPrice(newP: self.price)
            self.bill.setPeople(newP: self.nrPeople + 2)
            self.bill.setCiubuc(newC: Double(self.tips))
            self.showAlert = true
        }
        .alert(isPresented: $showAlert){
                        Alert(title: Text("Everyone should pay this:"),
                              message: Text("\(self.bill.splitBill())"),
                              dismissButton: .default(Text("Mersi Gionutzule")))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
