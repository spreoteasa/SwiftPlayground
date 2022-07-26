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
                SaveFlagButton()
            }
            HStack{
                Spacer()
               flagView
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

struct SaveFlagButton: View {
    var body: some View {
        Button("Save Flag", action: saveFlag)
            .frame(width: 90, height: 40)
            .background(Color("SaveFlagBackgroundBlue"))
            .foregroundColor(Color("BlueFontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    func saveFlag() {
        print("foo")
    }
}
