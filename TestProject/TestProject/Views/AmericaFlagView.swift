//
//  AmericaFlagView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import SwiftUI

struct AmericaFlagView: View {
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0) {
                Color.blue
                VStack(spacing: 0){
                    ForEach(0..<10) {
                        if $0%2 == 0 {
                            Color.white
                        }else {
                            Color.red
                        }
                    }
                }
            }
            VStack(spacing: 0){
                
                ForEach(0..<20) {
                    if $0%2 == 0 {
                        Color.white
                    }else {
                        Color.red
                    }
                }
            }
        }.frame(width: 300, height: 200)
        
    }
}

struct AmericaFlagView_Previews: PreviewProvider {
    static var previews: some View {
        AmericaFlagView()
    }
}
