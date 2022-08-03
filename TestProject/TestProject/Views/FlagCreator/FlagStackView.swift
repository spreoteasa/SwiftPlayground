//
//  FlagStackView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 26.07.2022.
//

import SwiftUI

struct FlagStackView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(alignment: .trailing, spacing: 40) {
            HStack{
                Spacer()
                SaveFlagButton(viewModelTree: $viewModel.treeStructure)
            }
            HStack{
                Spacer()
                viewModel.getWholeView()
                Spacer()
            }
            Spacer()
        }
        .frame(height: 300)
        
    }
    
    var flagView: some View {
         Rectangle()
            .frame(width: 300, height: 150, alignment: .center)
            .foregroundColor(viewModel.currentColor)
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}



struct SaveFlagButton: View {
    @Binding var viewModelTree: Tree
    var body: some View {
        Button("Save Flag", action: saveFlag)
            .frame(width: 90, height: 40)
            .background(Color("SaveFlagBackgroundBlue"))
            .foregroundColor(Color("BlueFontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    func saveFlag() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        let lmao = viewModelTree.getView()
        let image = lmao.snapshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
