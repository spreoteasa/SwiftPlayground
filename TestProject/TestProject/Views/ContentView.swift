//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @StateObject var currentColor = ViewModel()
    var body: some View {
        VStack{
            FlagStackView(viewModel: currentColor)
            DesignerView(currentColor: $currentColor.currentColor)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
