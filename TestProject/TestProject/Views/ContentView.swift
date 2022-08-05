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
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.33, alignment: .center)
                    .id(UUID())
                DesignerView(viewModel: viewModel)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.66, alignment: .center)
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
