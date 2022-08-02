//
//  ColorPickerView.swift
//  TestProject
//
//  Created by Preoteasa Ioan-Silviu on 26.07.2022.
//

import SwiftUI

struct DesignerView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ZStack {
            MainBackground()
                .background()
            VStack(spacing: 20){
                ZStack{
                    
                    BackgroundRectangle()
                    PickerSection(currentColor: $viewModel.currentColor)
                }
//                CustomButton(backgroundColor: "BlueFontColor",buttonText: "Add Stripe")
                Button {
//                    self.viewModel.treeStructure.add(newNode: <#T##Node#>)
                    print("Add Stripe")
                    switch self.viewModel.chosenType {
                    case .horizontal:
                        print("Add H")
                        self.viewModel.treeStructure.add(newNode: Node(value: AnyView(
                            HStack {
                                self.viewModel.currentColor
                            }
                        ), parent: self.viewModel.treeStructure.currentNode,type: .horizontal))
                    case .vertical:
                        print("Add V")
                        self.viewModel.treeStructure.add(newNode: Node(value: AnyView(
                            VStack {
                                self.viewModel.currentColor
                            }
                        ), parent: self.viewModel.treeStructure.currentNode,type: .vertical))
                    }
//                    self.viewModel.treeStructure.add(newNode: Node(value: AnyView, parent: <#T##Node?#>))
                }
            label: {
                Text("Add Stripe")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.custom("SF Pro Text", fixedSize: 24))
            }
                
            .frame(width: 300, height: 50)
            .background(Color("BlueFontColor"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
                AddSubsectionSection(viewModel: viewModel)
//                CustomButton(backgroundColor: "LightGreen", buttonText: "Commit Section")
                Button {
//                    self.viewModel.treeStructure.add(newNode: <#T##Node#>)
                    self.viewModel.treeStructure.commitSection()
                }
            label: {
                Text("Commit Section")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.custom("SF Pro Text", fixedSize: 24))
            }
                
            .frame(width: 300, height: 50)
            .background(Color("LightGreen"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

struct PickerSection: View {
    @Binding var currentColor: Color
    //    @EnvironmentObject private var currentColor: CurrentColor
    var body: some View {
        HStack{
            
            Spacer()
            VStack{
                Text("PICK COLOR")
                    .fontWeight(.semibold)
                ColorPicker("Color picker", selection: $currentColor)
                    .frame(width: 100, height: 25)
                //            .background(currentColor.currentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .labelsHidden()
                
                
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
    @EnvironmentObject private var currentColor: ViewModel
    var body: some View {
        ColorPicker("Color picker", selection: $currentColor.currentColor)
            .frame(width: 100, height: 25)
        //            .background(currentColor.currentColor)
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .labelsHidden()
        
    }
}

struct AddStripeButton: View {
    var backgroundColor: String = "BlueFontColor"
    var buttonText: String = "Add Stripe"
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
    @ObservedObject var viewModel: ViewModel
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
                    Button {
                        self.viewModel.chosenType = .horizontal
                    }
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
                    Button {
                        self.viewModel.chosenType = .vertical
                        print(self.viewModel.treeStructure.root.children.count)
                    }
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

//
//struct DesignerView_Previews: PreviewProvider {
//    static var previews: some View {
////        DesignerView(currentColor: .constant(.green))
//    }
//}
