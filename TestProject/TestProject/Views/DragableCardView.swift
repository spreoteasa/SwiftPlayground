//
//  DragableCardView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import Foundation
import SwiftUI


struct DragableCardView : View {
    
    @State private var dragAmount = CGSize.zero
    var body: some View {
        Text("hsbfjbs")
        LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation{
                            dragAmount = .zero
                        }
                    }
            )
        //            .animation(.default)
    }
}


struct DragableCardView_Previews: PreviewProvider {
    static var previews: some View {
        DragableCardView()
    }
}
