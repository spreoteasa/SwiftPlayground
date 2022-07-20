//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var toggledVariable = false
    var body: some View {
        ZStack{
            //            LinearGradient(gradient: Gradient(colors: [.blue, Color(red: 0.5, green: 1, blue: 0.8)]), startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.5, green: 1, blue: 0.8), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.4, blue: 0.7), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack{
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.orange)
                Spacer()
                
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the flag of:")
                            .font(.subheadline.weight(.medium))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                        
                    }
                    ForEach(0..<3){number in
//                        Spacer()
                        Button{
                            print("The flag of \(countries[number]) was clicked")
                            self.toggledVariable.toggle()
                            print(toggledVariable)
                            flagTapped(number)
                        } label:{
                            Image(countries[number])
                                .renderingMode(.original)
                                .resizable()
                                .clipShape(Capsule())
                                .shadow(radius:5)
                        }
                        
                        
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
            
                .alert(scoreTitle, isPresented: $showScore ){
                Button("OK", action: askQuestion)
            } message: {
                Text("Keep Going?")
            }
            
        }
    }
    func flagTapped(_ chosenFlag: Int) {
        if chosenFlag == self.correctAnswer {
            print("Correct")
            self.score += 1
        }
        else {
            print("Wrong")
        }
//        print(type(of: self.body))
        self.showScore = true
    }
    
    func askQuestion(){
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
