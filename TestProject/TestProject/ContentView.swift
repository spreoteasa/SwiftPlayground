//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State var name = ""
    @State var showAlert = false
    @State private var selectionCase = "Happy Gion"
    let gionutzi = ["Gigi Becali", "Happy Gion", "Sad Gion", "Chelutzu"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Texty")
                    Text("Texty")
                    Text("Texty")
                    Text("Texty")
                    Text("Texty")
                    Text("Texty")
                }
            }
            .navigationTitle("FirstUI")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        
        Form{
            Section{
                TextField("Your name here...",text: $name){
                    
                }
            }
        }
        
        Form{
            Picker("Choose your fighter",selection: $selectionCase){
                ForEach(gionutzi, id: \.self){
                    Text("\($0)")
                }
            }
        }
        Section{
            Button("Tap Count: \(tapCount)"){
                tapCount += 1
                if tapCount % 10 == 0{
                    self.name = "Hatz GIONULE"
                    self.showAlert = true
                }
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("You clicked 10xsmth times WOOOW"),
                      message: Text("LMAO"),
                      dismissButton: .default(Text("Mersi Gionutzule")))
                
            }
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
