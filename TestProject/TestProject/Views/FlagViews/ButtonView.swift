//
//  ButtonView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    var action: () -> Void
    var body: some View {
        Button { action() } label: {Text("Murica")}
            .foregroundColor(.orange)
            .font(.title)
            .frame(width: 90, height: 40)
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
