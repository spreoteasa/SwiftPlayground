//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @StateObject var currentColor = CurrentColor()
    var body: some View {
        VStack{
            FlagStackView().environmentObject(currentColor)
            DesignerView().environmentObject(currentColor)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
