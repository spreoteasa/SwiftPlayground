//
//  TemperatureConversionView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import SwiftUI

struct TemperatureConversionView: View {
    @State var temperature: Double = 0.0
    @State var tempConverter: TemperatureConverter = TemperatureConverter()
    @State var initialTempType: TemperatureType = .celsius
    @State var showAlert: Bool = false
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Initial State", selection: $initialTempType){
                        ForEach(TemperatureType.allCases,id: \.self){ tempType in
                            Text(tempType.rawValue)
                            
                        }
                    }
                } header:{
                    Text("What is the base temperature type?")
                }
                Section{
                    TextField("",value: $temperature,
                              format: .number)
                        .keyboardType(.numberPad)
                } header:{
                    Text("What temperature value do you want to convert?")
                }
                
                Button("Convert"){
                    self.tempConverter.temperature = self.temperature
                    self.tempConverter.initialType = self.initialTempType
                    self.showAlert = true
                }
                .alert(isPresented: $showAlert){
                        Alert(title: Text("Conversion result:"),
                                message: Text((self.tempConverter.convert())),
                                dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    }
}

struct TemperatureConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConversionView()
    }
}
