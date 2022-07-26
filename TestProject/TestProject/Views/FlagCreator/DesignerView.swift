//
//  ColorPickerView.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import SwiftUI

struct DesignerView: View {
//    @Binding var currentColor: Color
    @StateObject private var currentColor = CurrentColor()
    var body: some View {
        ZStack {
            MainBackground()
                .background()
            VStack(spacing: 20){
                ZStack{
                    
                    BackgroundRectangle()
                    PickerSection().environmentObject(currentColor)
                }
                CustomButton(backgroundColor: "BlueFontColor",buttonText: "Add Stripe")
                AddSubsectionSection()
                CustomButton(backgroundColor: "LightGreen", buttonText: "Commit Section")
            }
        }
    }
}

struct PickerSection: View {
//    @Binding var currentColor: Color
    @EnvironmentObject private var currentColor: CurrentColor
    var body: some View {
        HStack{
            
            Spacer()
            VStack{
                Text("PICK COLOR")
                    .fontWeight(.semibold)
                ColorPickerButton()
            }
            Spacer()
            VStack{
                Text("PICK EMBLEM")
                    .fontWeight(.semibold)
                EmblemPickerButton()
            }
            Spacer()
            
        }.frame(width:300, height: 100)
    }
}

struct BackgroundRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 100)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: .gray, radius: 3, x: 0, y: 0)
    }
}

struct EmblemPickerButton: View {
    var body: some View {
        Button {}
    label: {
        Image(systemName: "photo.on.rectangle")
    }.frame(width: 100, height: 25)
            .foregroundColor(Color("LightGray"))
    }
}


struct ColorPickerButton: View {
//    @State var currentColor:Color = .green
    @EnvironmentObject private var currentColor: CurrentColor
    var body: some View {
        ColorPicker("Color picker", selection: $currentColor.currentColor)
            .frame(width: 100, height: 25)
//            .background(currentColor.currentColor)
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .labelsHidden()
            
    }
}

struct CustomButton: View {
    var backgroundColor: String = ""
    var buttonText: String = ""
    var body: some View {
        Button {
            print("hehe")
        }
    label: {
        Text(buttonText)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .font(.custom("SF Pro Text", fixedSize: 24))
    }
        
    .frame(width: 300, height: 50)
    .background(Color(backgroundColor))
    .clipShape(RoundedRectangle(cornerRadius: 5))
        //    .shadow(color: .gray, radius: 3, x: 0, y: 0)
        
        
    }
}

struct AddSubsectionSection: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300, height: 100)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
            VStack {
                Text("Add Stripe")
                    .foregroundColor(Color("BlueFontColor"))
                    .fontWeight(.bold)
                    
                HStack{
                    Spacer()
                    Button { }
                label: {
                    Image(systemName: "rectangle.grid.1x2.fill")
                        .resizable()
                        .frame(width:20,height:20)
                        .foregroundColor(Color("BlueFontColor"))
                        .rotationEffect(.degrees(90))
                        
                    
                }
                    Spacer()
                    Image(systemName: "line.diagonal")
                        .resizable()
                        .frame(width:5, height:40)
                        .rotationEffect(.degrees(173))
                        .foregroundColor(Color("LightGray"))
                    Spacer()
                    Button { }
                label: {
                    Image(systemName: "rectangle.grid.1x2.fill")
                        .resizable()
                        .frame(width:20,height:20)
                        .foregroundColor(Color("BlueFontColor"))
                        
                }
                    Spacer()
                }.frame(width:300)
            }
        }
    }
}

struct MainBackground: View {
    var body: some View {
        GeometryReader {geometry in
            Rectangle()
            
                .frame(width:geometry.size.width * 1,
                       height: geometry.size.height * 1)
                .foregroundColor(Color("LightGray"))
            
            
        }
        
    }
}


struct DesignerView_Previews: PreviewProvider {
    static var previews: some View {
        DesignerView()
    }
}
