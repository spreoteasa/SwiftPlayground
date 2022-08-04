//
//  GreeceFlagView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import SwiftUI

struct GreeceFlagView: View {
    var twoBlueWhiteTwoBlueVStack = VStack(spacing: 0){
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
        Color.white
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
    }
    
    var blueWhiteBlueHStack = HStack(spacing: 0){
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
        Color.white
        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
    }
    
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    twoBlueWhiteTwoBlueVStack
                    VStack(spacing: 0) {
                        blueWhiteBlueHStack
                        blueWhiteBlueHStack
                        Color.white
                        blueWhiteBlueHStack
                        blueWhiteBlueHStack
                    }
                    VStack(spacing: 0){
                        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                        Color.white
                        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                        Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                    }
                }
                VStack(spacing: 0){
                    Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                    Color.white
                    Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                    Color.white
                    Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                }
            }
            VStack(spacing: 0){
                Color.white
                Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
                Color.white
                Color(red: 0.05, green: 0.3, blue: 0.68)//RGB: 13,94,175.
            }
        }
        .frame( width: 300, height: 200)
    }
    
    
}

struct GreeceFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GreeceFlagView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
