//
//  TimeConversionView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 14.07.2022.
//

import SwiftUI

struct TimeConversionView: View {
    @State var initialTimeType: TimeTypes = .minute
    @State var finalTimeType: TimeTypes = .minute
    @State var timeValue: Int = 0
    @State var timeConverter: TimeConverter = TimeConverter()
    @State var showAlert: Bool = false
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Initial State", selection: $initialTimeType){
                        ForEach(TimeTypes.allCases,id: \.self){ timeType in
                            Text(timeType.rawValue)
                            
                        }
                    }
                } header:{
                    Text("What is the base time type?")
                }
                Section{
                    TextField("Insert how much the bill will cost",value: $timeValue,
                              format: .number)
                        .keyboardType(.numberPad)
                } header:{
                    Text("What time value do you want to convert?")
                }
                Section{
                    Picker("Final State", selection: $finalTimeType){
                        ForEach(TimeTypes.allCases,id: \.self){ timeType in
                            Text(timeType.rawValue)
                            
                        }
                    }
                } header:{
                    Text("What is the final time type?")
                }
                
                Button("Convert"){
                    self.timeConverter.timeValue = self.timeValue
                    self.timeConverter.initialState = self.initialTimeType
                    self.timeConverter.finalState = self.finalTimeType
                    self.showAlert = true
                }
                .alert(isPresented: $showAlert){
                        Alert(title: Text("Conversion result:"),
                                message: Text((self.timeConverter.convert())),
                                dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Time Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}}
