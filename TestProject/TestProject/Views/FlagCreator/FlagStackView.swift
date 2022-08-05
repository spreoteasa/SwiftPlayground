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
        GeometryReader { geometry in
            VStack(alignment: .trailing, spacing: 20 ) {
                HStack{
                    Spacer()
                    SaveFlagButton(viewModel: viewModel)
                        .padding(10)
                    
                }.frame(height: geometry.size.height * 0.2)
                HStack{
                    Spacer()
                    viewModel.getWholeView()
                        .onTapGesture {
                            let image = self.snapshot()
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                    Spacer()
                
                }.frame(height: geometry.size.height * 0.7)
                Spacer()
            }
            .frame(height: geometry.size.height)
        }
        
        
        
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
    
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
        
        if let view = controller.view {
            let contentSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: contentSize)
            view.backgroundColor = .clear
            
            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
}



struct SaveFlagButton: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Button("Save Flag", action: saveFlag)
            .frame(width: 90, height: 40)
            .background(Color("SaveFlagBackgroundBlue"))
            .foregroundColor(Color("BlueFontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    func saveFlag() {
        let image = viewModel.getWholeView().asUiImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
