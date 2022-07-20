//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmmount: Double = 8.0
    @State private var wakeUp: Date = Date.now
    @State private var coffeeAmmount: Int = 1
    @State private var alertTitle: String = "Error"
    @State private var showingAlert: Bool = false
    @State private var alertMessage: String = "Sorry, there was a problem calculating your bedtime."
    var body: some View {
        VStack {
            
            Text("When do you want to wake up?")
                .font(.headline)
            
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Text("Desired ammount of sleep")
                .font(.headline)
            Stepper("\(sleepAmmount.formatted()) hours", value: $sleepAmmount, in: 4...12)
            
            Text("Daily coffee intake")
            Stepper(coffeeAmmount == 1 ? "1 cup" : "\(coffeeAmmount) cups", value: $coffeeAmmount, in: 1...20)
            
            Button("Calculate", action: calculateBedTime)
                .alert(alertTitle, isPresented: $showingAlert){
                    Button("OK") { }
                } message: {
                    Text(alertMessage)
                }
            
        }
//        .navigationTitle("BetterSleep")
//        .toolbar {
//            Button("Calculate", action: calculateBedTime)
//        }
//        .navigationBarHidden(false)
//        .navigationBarTitleDisplayMode(.inline)
       
        
    }
    
    
    
    
    
    func calculateBedTime() {
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmmount, coffee: Double(coffeeAmmount))
            let sleeptime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleeptime.formatted(date: .omitted, time: .shortened)
            showingAlert = true
        } catch {
            print("There was an oopsie")
            showingAlert = true
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
