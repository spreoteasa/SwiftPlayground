//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel(tree: Tree(root: Node(value: Color.gray, icon: "", parent: nil,type: .horizontal)))
    var body: some View {
        GeometryReader { geometry in
            VStack{
                FlagStackView(viewModel: viewModel)
                    .frame(width: .infinity, height: geometry.size.height * 1/3)
                    .id(UUID())
                DesignerView(viewModel: viewModel)
                    .frame(width: .infinity, height: geometry.size.height * 2/3)
                    .id(UUID())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
