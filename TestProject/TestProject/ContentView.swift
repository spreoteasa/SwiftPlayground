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
    
    var calculateButton: some View {
        Button("Calculate", action: calculateBedTime)
            .alert(isPresented: $showingAlert){
                Alert(title: Text(self.alertTitle), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
            }
            .foregroundColor(.black)
    }
    
    var entryInformation: some View {
        return VStack {
            
            Text("When do you want to wake up?")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .center)
            VStack {
                Text("Desired ammount of sleep")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Stepper("\(sleepAmmount.formatted()) hours", value: $sleepAmmount, in: 4...12)
            Text("Daily coffee intake")
                .frame(maxWidth: .infinity, alignment: .center)
            Stepper(coffeeAmmount == 1 ? "1 cup" : "\(coffeeAmmount) cups", value: $coffeeAmmount, in: 1...20)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.5, green: 1, blue: 0.8), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.4, blue: 0.7), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
                
                entryInformation
                    .navigationTitle("BetterSleep")
                    .toolbar {
                        calculateButton
                    }
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .background(.ultraThinMaterial)
                    .foregroundColor(.white)
                    
            }
        }
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
            print(alertMessage)
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
