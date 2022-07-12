//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Text("Texty")
                       
                }
            }
            .navigationTitle("FirstUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
        
//        Form{
//            Section{
//                Group{
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                }
//            }
//            Section{
//                Group{
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                }
//            }
//            Section{
//                Group{
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                }
//            }
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
