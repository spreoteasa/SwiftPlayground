//
//  PreviewPlaygroundView.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import SwiftUI

struct PreviewPlaygroundView: View {
    @State var color: Color = Color.pink
    var body: some View {
        
        ColorPicker("", selection: $color)
            .opacity(1)
            .scaleEffect(CGSize(width:6, height: 6))
            .labelsHidden()
            
        
    }
}



struct PreviewPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPlaygroundView()
    }
}
