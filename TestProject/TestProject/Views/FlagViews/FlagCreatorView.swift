//
//  FlagCreatorView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import SwiftUI

struct FlagCreatorView: View {
    @State var flags: [Any] = []
    var body: some View {
        VStack{
            ZStack {
                AmericaFlagView()
            }
        }

        Section {
            HStack(spacing: 10) {
                ButtonView(buttonText: "hehe") {
                    print("HEHE")
                }
            }
        }
        Spacer()
    }
}




struct FlagCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        FlagCreatorView()
    }
}
