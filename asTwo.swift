//easy
//1
let fruits: [String] = ["apple", "banana", "pinapple", "orange", "melon"]
print(fruits[2])
//4
var setOfNumbers: Set<Int> = [5, 25, 50, 100, 555]
setOfNumbers.insert(7)
print(setOfNumbers)
//3
let programmingLanguages: [String: Int] = ["C++": 93, "Python": 97, "Swift": 15]
print(programmingLanguages["Swift"] ?? 0)
//4
var someArr = ["Black", "Blue", "Red", "White"] as Array
someArr[1] = "Purple"
print(someArr)
//medium
//1
let firstSet = [1, 2, 3, 4] as Set<Int>
let secondSet = [5, 6, 7, 8] as Set<Int>
var thirdSet = firstSet.union(secondSet)
print(thirdSet)
//2
var students = ["S1": 90, "S2": 70, "S3": 67] as [String: Int]
students["S3"] = 70
print(students)
//3
var arr1 = ["apple", "banana"]
let arr2 = ["cherry", "date"]
arr1 += arr2
print(arr1)
//hard
//1
var countries = ["Kazakhstan": 20000000, "USA": 350000000, "Germany": 80000000] as [String: Int]
countries["Russia"] = 140000000
print(countries)
//2
var an1 = ["cat", "dog"] as Set<String>
var an2 = ["dog", "mouse"] as Set<String>
an1.union(an2)
an1.subtract(an2)
print(an1)
//3
let dic = ["Darkhan": [1, 2, 3]] as [String: [Int]]
print(dic["Darkhan"]![1])