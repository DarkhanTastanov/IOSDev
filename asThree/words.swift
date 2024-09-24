import Foundation
if let input = readLine() {
    let cleanInput = input.lowercased().filter { $0.isLetter || $0.isWhitespace }
    let wordList = CleanInput.split(separator: " ").map {String($0)}
    var wordFrecuency = [String: Int]()

    for word in wordList{
        wordFrecuency[word, default: 0] += 1
    }
    for (word, frecuency) in wordFrecuency{
        print("\(word): \(frecuency)")
    }
}