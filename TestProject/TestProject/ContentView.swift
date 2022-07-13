import SwiftUI

struct ContentView: View {
    
    
    @State private var nrPeople: Int = 1
    @State private var price: Double = 0.0
    @State private var tips: Int = 0
    @State private var showAlert: Bool = false
    @State private var change: Bool = false
    let tipPercentages = [0,5,10,15,25]
    var bill: Bill = Bill()
    var body: some View {
        Color.purple
            .ignoresSafeArea() // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Text("Split.io").font(.largeTitle)
                        Text("A simple bill splitter").font(.title).foregroundColor(.white)
                
        
        NavigationView{
            Form{
                Section{
                    
                    TextField("Insert how much the bill will cost",value: $price,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                } header: {
                    Text("How much was the bill?")
                }
                Section{
                    Picker("Number of people", selection: $nrPeople){
                        ForEach(2..<100){
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("How many of people are splitting the bill?")
                }
               
                Section{
                    Picker("Tip percentage", selection: $tips){
                        ForEach(tipPercentages, id: \.self){ tip in
                            Text(tip,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much do you want to tip?")
                }
                
                
            }
        }
                    })
        
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
        .tint(.mint)
    
        Button("ChangeView"){
            print("Yolo Varule")
            self.change = true
        }.sheet(isPresented: $change){
            EmptyView()
        }
//        Image(systemName: "heart.fill")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
