//
//  LengthConversionView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import SwiftUI

struct LengthConversionView: View {
    @State var initialLengthType: LengthType = .centimeter
    @State var finalLengthType: LengthType = .centimeter
    @State var lengthValue: Int = 0
    @State var lengthConverter: LengthConverter = LengthConverter()
    @State var showAlert: Bool = false
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Initial State", selection: $initialLengthType){
                        ForEach(LengthType.allCases,id: \.self){ lengthType in
                            Text(lengthType.rawValue)
                            
                        }
                    }
                } header:{
                    Text("What is the base length type?")
                }
                Section{
                    TextField("",value: $lengthValue,
                              format: .number)
                        .keyboardType(.numberPad)
                } header:{
                    Text("What length value do you want to convert?")
                }
                Section{
                    Picker("Final State", selection: $finalLengthType){
                        ForEach(LengthType.allCases,id: \.self){ lengthType in
                            Text(lengthType.rawValue)
                            
                        }
                    }
                } header:{
                    Text("What is the final length type?")
                }
                
                Button("Convert"){
                    self.lengthConverter.length = self.lengthValue
                    self.lengthConverter.initialLengthType = self.initialLengthType
                    self.lengthConverter.finalLengthType = self.finalLengthType
                    self.showAlert = true
                }
                .alert(isPresented: $showAlert){
                        Alert(title: Text("Conversion result:"),
                                message: Text((self.lengthConverter.compute())),
                                dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Length Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    }
}

struct LengthConversionView_Previews: PreviewProvider {
    static var previews: some View {
        LengthConversionView()
    }
}
