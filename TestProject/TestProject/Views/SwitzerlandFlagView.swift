//
//  SwitzerlandFlagView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 25.07.2022.
//

import SwiftUI

struct SwitzerlandFlagView: View {
    var body: some View {
        HStack(spacing: 0){
            HStack{
                VStack(spacing: 0){
                    Color.red
                    VStack(spacing: 0){
                        Color.red
                        HStack(spacing: 0){
                            Color.red
                            HStack(spacing: 0){
                                Color.red
                                Color.white
                            }
                        }
                        Color.red
                    }
                    Color.red
                }
            }
            VStack(spacing: 0){
                Color.red
                VStack(spacing: 0){
                    Color.red
                    Color.white
                    Color.red
                }
                Color.red
            }
            VStack{
                VStack(spacing: 0){
                    Color.red
                    VStack(spacing: 0) {
                        Color.red
                        VStack(spacing: 0) {
                            Color.red
                            Color.white
                        }
                    }
                }
                Color.white
                VStack(spacing: 0){
                    VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Color.white
                            Color.red
                        }
                        Color.red
                    }
                    Color.red
                }
            }
            VStack(spacing: 0){
                Color.red
                VStack(spacing: 0){
                    Color.red
                    Color.white
                    Color.red
                }
                Color.red
            }
            HStack{
                VStack(spacing: 0){
                    Color.red
                    VStack(spacing: 0){
                        Color.red
                        HStack(spacing: 0){
                            HStack(spacing: 0){
                                Color.white
                                Color.red
                                
                            }
                            Color.red
                        }
                        Color.red
                    }
                    Color.red
                }
            }
        }
    }
}

struct SwitzerlandFlagView_Previews: PreviewProvider {
    static var previews: some View {
        SwitzerlandFlagView()
    }
}
