//
//  EmptyView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 13.07.2022.
//

import SwiftUI

struct EmptyView: View {
    @State private var change: Bool = false
    var body: some View {
        Text("This is your pushed view...")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
        
        Button("ChangeView"){
            print("Yolo Varule")
            self.change = true
        }.sheet(isPresented: $change){
            ContentView()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
