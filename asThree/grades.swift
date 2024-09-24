import Foundation
let students = ["Darkhan": 85, "John": 72, "Tastanov": 90]
let totalScore = students.values.reduce(0, +)
let averageScore = totalScore / students.count

let highestScore = students.values.max() ?? 0
let lowestScore = students.values.min() ?? 0

for (name, score) in students {
    let status = score >= averageScore ? "above" : "below"
    print("\(name): \(score) (\(status) average)")
}

print("\nAverage Score: \(averageScore)")
print("Highest Score: \(highestScore)")
print("Lowest Score: \(lowestScore)")