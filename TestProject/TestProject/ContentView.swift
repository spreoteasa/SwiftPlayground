//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var goToTimeConversion: Bool = false
    var body: some View {
            NavigationView{
                    VStack(alignment: .center){
                        Button{
                            print("Clicked")
                            self.goToTimeConversion = true
                        } label:{
                            Image(systemName: "timer")
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                        .sheet(isPresented: $goToTimeConversion){
                            TimeConversionView()
                        }
                        
                        Button{
                            print("Clicked2")
                        } label:{
                            Image(systemName: "ruler")
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                        Button{
                            print("Clicked3")
                        }label:{
                            Image(systemName: "sun.max")
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                       
                    }.frame(maxWidth: .infinity)
                    
                
                    .background(Color.mint)
                    .lineSpacing(11.0)
                    .navigationTitle(Text("Convert.io"))
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        
        
        //Time, Length, Temperature
        

    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
