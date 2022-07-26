//
//  FlagStackView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 26.07.2022.
//

import SwiftUI

struct FlagStackView: View {
    var body: some View {
        SaveFlagButton()
    }
}

struct SaveFlagButton: View {
    var body: some View {
        Button("Save Flag") { }
            .background(Color("SaveFlagBackgroundBlue"))
            .foregroundColor(Color("BlueFontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(width: 100, height: 80)
    }
}


struct FlagStackView_Previews: PreviewProvider {
    static var previews: some View {
        FlagStackView()
    }
}
