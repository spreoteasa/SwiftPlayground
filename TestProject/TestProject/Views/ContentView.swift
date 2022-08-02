//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel(tree: Tree(root: Node(value: AnyView(HStack{Color.gray}), parent: nil,type: .horizontal)))
    var body: some View {
        VStack{
            FlagStackView(viewModel: viewModel)
            DesignerView(viewModel: viewModel)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
