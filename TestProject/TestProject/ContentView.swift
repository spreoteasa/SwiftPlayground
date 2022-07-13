import SwiftUI

struct ContentView: View {
    
    @State var nrPeople: String = ""
    @State var price: String = ""
    @State var tips: String = ""
    @State var showAlert: Bool = false
    var bill: Bill = Bill()
    var body: some View {
        
        NavigationView{
            Form{
                TextField("How many people are paying?", text: $nrPeople)
                TextField("Insert how much the bill will cost",text: $price)
                TextField("Insert how much you want to tip in %", text: $tips)
            }
            .navigationTitle("Split.io")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        Button("Compute"){
            let pr = Double(self.price) ?? 0.1
            let pe = Int(self.nrPeople) ?? 1
            let ci = Double(self.tips) ?? 0
            self.bill.setPrice(newP: pr)
            self.bill.setPeople(newP: pe)
            self.bill.setCiubuc(newC: ci)
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
