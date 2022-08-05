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
                    Spacer()
                
                }.frame(height: geometry.size.height * 0.7)
                Spacer()
            }
            .frame(height: geometry.size.height)
        }
        
        
        
    }
    
}

extension View {
  func saveAsImage(width: CGFloat, height: CGFloat, _ completion: @escaping (UIImage) -> Void) {
    let size = CGSize(width: width, height: height)
    let controller = UIHostingController(rootView: self.frame(width: width, height: height))
//    controller.view.bounds = CGRect(origin: .zero, size: size)
    controller.view.bounds = CGRect(x: 0, y: -10, width: width, height: height + 50)
    let image = controller.view.asImage()
    completion(image)
  }
}
extension UIView {
  func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
    return renderer.image { ctx in
      self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
    }
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
        let image = viewModel.getWholeView().saveAsImage(width: 300, height: 150) { image in
            let sideLength = min(
                image.size.width,
                image.size.height - 65
            )
            let sourceSize = image.size
            let xOffset = 8.0
            let yOffset = 74.0
            
            let cropRect = CGRect(
                x: xOffset,
                y: yOffset,
                width: 3000.0,
                height: 300.0
            ).integral
            let sourceCGImage = image.cgImage!
            let croppedCGImage = sourceCGImage.cropping(
                to: cropRect
            )!
            UIImageWriteToSavedPhotosAlbum(UIImage(cgImage: croppedCGImage), nil, nil, nil)
        }
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
