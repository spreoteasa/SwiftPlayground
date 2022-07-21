//
//  ContentView.swift
//  TestProject
//
//  Created by Silviu Preoteasa on 12.07.2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingMessage = false
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("Insert your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .onSubmit(addNewWord)
                        .onAppear(perform: startGame)
                        .alert(errorTitle,isPresented: $showingMessage) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text(errorMessage)
                        }
                }
                
                Section {
                    ForEach(usedWords, id:\.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Start Game", action: startGame)
                }
            }
        }
        
    }
    
    func insertWordConditions(word: String) -> Bool {
        return spellChecker(word: word) == true && word.count > 0 && !usedWords.contains(word) && isPossible(word: word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        //check if word complies to the rules
        guard insertWordConditions(word: answer) == true else {
            wordError(title: "Not real / misspelled / impossible / already used", message: "Dumbooo")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool{
        return usedWords.contains(word)
    }
    
    func spellChecker(word: String) -> Bool {
        //create a checker
        let checker = UITextChecker()
        //get the range of the word
        let range = NSRange(location: 0, length: word.utf16.count)
        //check the provided word
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //return wether or not the user comitted an oopsie
        return misspelledRange.location == NSNotFound
    }
    
    func restart() {
        self.usedWords = []
        self.rootWord = ""
        self.newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "sternocleidomastoidian"
                
                return
            }
        }
        fatalError("Could not load start file from bundle!")
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingMessage = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
