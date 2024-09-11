import Foundation
// import UIkit
// import Cocao

// STEP 1
let firstName:String = "Darkhan"
let lastaname: String = "Tastanov"
var isStudent: Bool = true
var height: Double = 165.001

// BIRTH DAY
var birthDateTime = DateComponents()
birthDateTime.year = 2004
birthDateTime.month = 12
birthDateTime.day = 30
var birthDate: Date = Calendar.current.date(from: birthDateTime) ?? Date() 

// TODAY
let currentDate: Date = Date()
// CALCULATION
var age = Calendar.current.dateComponents([.year], from: birthDate, to: currentDate) 

var ageToday = age.year ?? 0

// STEP 2
var hobby: String = "Chess"
var numberOfHobbies: Int = 5
var favoritNumber: Int = 5
var isHobbyCreative: Bool = true

// FUNCTIONS
func checkStudent(_ isStudent: Bool) -> String {
    return isStudent ? "I am currently a student" : "I am not a student"
}
func checkHobby(_ isHobbyCreative: Bool) -> String {
    return isHobbyCreative ? "a creative hobby" : "not a creative hobby"
}

// STEP 3
var lifeStory: String = """
My name is \(firstName) \(lastaname).
I am \(ageToday) years old, born in \(birthDateTime.year ?? 0).
\(checkStudent(isStudent)).
I enjoy \(hobby), which is \(checkHobby(isHobbyCreative)).
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoritNumber).
"""
// STEP 4 + BONUS

print(lifeStory + "\nIn the future, I want to become a professional iOS developer")


