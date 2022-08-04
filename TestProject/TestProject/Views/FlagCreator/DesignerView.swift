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
                    PickerSection(currentColor: $viewModel.currentColor, isPresented: $viewModel.isPresented, currentIcon: $viewModel.currentIcon)
                }

                Button {

                    switch self.viewModel.chosenType {
                    case .horizontal:
                        self.viewModel.add(newNode: Node(value: self.viewModel.currentColor, icon: self.viewModel.currentIcon
                        , parent: self.viewModel.treeStructure.currentNode,type: .horizontal))
                    case .vertical:
                        self.viewModel.add(newNode: Node(value: self.viewModel.currentColor, icon: self.viewModel.currentIcon
                        , parent: self.viewModel.treeStructure.currentNode,type: .vertical))
                    }

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

                Button {

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
                
                Button {

                    self.viewModel.treeStructure.goUp()
                }
            label: {
                Text("Pop Back")
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
    func addHStack() {
        self.viewModel.add(newNode: Node(value: self.viewModel.currentColor, icon: self.viewModel.currentIcon
        , parent: self.viewModel.treeStructure.currentNode,type: .horizontal))
    }
    
    func addVStack() {
        self.viewModel.add(newNode: Node(value: self.viewModel.currentColor, icon: self.viewModel.currentIcon
        , parent: self.viewModel.treeStructure.currentNode,type: .vertical))    }
}

struct PickerSection: View {
    @Binding var currentColor: Color
    @Binding var isPresented: Bool
    @Binding var currentIcon: String
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("PICK COLOR")
                    .fontWeight(.semibold)
                ColorPicker("Color picker", selection: $currentColor)
                    .frame(width: 100, height: 25)
                
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .labelsHidden()
            }
            Spacer()
            VStack{
                Text("PICK EMBLEM")
                    .fontWeight(.semibold)
                Button {
                    isPresented = true
                    print(self.currentIcon)
                }
            label: {
                Image(systemName: "photo.on.rectangle")
            }.frame(width: 100, height: 25)
                    .foregroundColor(Color("LightGray"))
            }
            .sheet(isPresented: $isPresented) {
                SFSymbolsPicker(icon: $currentIcon)
                
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

struct ColorPickerButton: View {
    @EnvironmentObject private var currentColor: ViewModel
    var body: some View {
        ColorPicker("Color picker", selection: $currentColor.currentColor)
            .frame(width: 100, height: 25)
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
                        if self.viewModel.treeStructure.rootWasPopulated == false {
                            self.viewModel.chosenType = .horizontal
                            self.viewModel.treeStructure.rootWasPopulated = true
                        }
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
                        if self.viewModel.treeStructure.rootWasPopulated == false {
                            self.viewModel.chosenType = .vertical
                            self.viewModel.treeStructure.rootWasPopulated = true
                        }
                        self.viewModel.chosenType = .vertical
//                        print(self.viewModel.treeStructure.root.children.count)
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

