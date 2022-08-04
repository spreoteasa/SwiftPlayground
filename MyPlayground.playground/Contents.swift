import UIKit

let input = "a b c"
let letters = input.components(separatedBy:  " ")
let input2 = """
a

b

c
"""
let noSpace = input2.components(separatedBy: "\n")


let randomCharacter = letters.randomElement()


//let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)


let word = "potato"
let checker = UITextChecker()

let range = NSRange(location: 0, length: word.utf16.count)

let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

let allGood = misspelledRange.location == NSNotFound
