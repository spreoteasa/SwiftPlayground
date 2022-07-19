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
    var body: some View {
        ZStack{
            Color(red: 0.5, green: 1, blue: 0.8)
                .ignoresSafeArea()
            VStack(spacing: 30){
                
                VStack{
                    Text("Tap the flag of:")
                    Text(countries[correctAnswer])
                }
                ForEach(0..<3){number in
                    Button{
                        print("The flag of \(countries[number]) was clicked")
                        flagTapped(number)
                    } label:{
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    
                }
            }
        }
        .alert(scoreTitle, isPresented: $showScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
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
