// FizzBuzz
var i = 1
while i < 101{
    if (i % 15 == 0){
        print("FizzBuzz")
    }
    else if (i % 3 == 0){
        print("Fizz")

    }
    else if (i % 5 == 0){
        print("Buzz")
        
    }
    else{
        print(i)
        }
    i = 1 + i
}
// Optimus is Prime
func isPrime(_ number:Int) -> Bool{
    if number <= 1{
        return false
    }
    for i in 2..<number{
        if number % i == 0{
            return false
        }
    }
    return true
}

var j = 1
while j <= 100{
    print(isPrime(j))
    j = 1 + j
}
// Temperature converter

import Foundation
func temperatureConvertor(_ input: String){
    let temperature = input.split(separator: " ")
    
    if temperature.count == 2, let value = Double(temperature[0]) {
        let unit = String(temperature[1]).uppercased()
        
        switch unit {
        case "C":
            let fahrenheit = (value * 9/5) + 32
            let kelvin = value + 273.15
            print("\(value) °C is equal to \(fahrenheit) °F and \(kelvin) K.")
        
        case "F":
            let celsius = (value - 32) * 5/9
            let kelvin = (value - 32) * 5/9 + 273.15
            print("\(value) °F is equal to \(celsius) °C and \(kelvin) K.")
        
        case "K":
            let celsius = value - 273.15
            let fahrenheit = (celsius * 9/5) + 32
            print("\(value) K is equal to \(celsius) °C and \(fahrenheit) °F.")
        
        default:
            print("Unknown unit.")
        }
    } else {
        print("Invalid input format")
    }
}

print("Enter temperature and unit:")
if let input = readLine() {
    temperatureConvertor(input)
}
// Shopping List Manager
import Foundation

var shoppingList = [String]()

func displayMenu() {
    print("""
    \n--- Shopping List Manager ---
    1. Add an item to the shopping list
    2. Remove an item from the shopping list
    3. Display the current shopping list
    4. Exit the application
    Please enter your choice (1-4):
    """)
}

func addItem() {
    print("Enter the item to add:")
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("'\(item)' has been added.")
    } else {
        print("Invalid input.")
    }
}

func removeItem() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
        return
    }
    
    print("Enter the item to remove:")
    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("'\(item)' has been removed.")
    } else {
        print("Item is not in the shopping list.")
    }
}

func displayList() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
    } else {
        print("\n--- Current Shopping List ---")
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}

func shoppingListManager() {
    var shouldExit = false
    
    while !shouldExit {
        displayMenu()
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                addItem()
            case 2:
                removeItem()
            case 3:
                displayList()
            case 4:
                shouldExit = true
                print("Exiting the application.")
            default:
                print("Please choose between 1 and 4.")
            }
        } else {
            print("Please enter a number between 1 and 4.")
        }
    }
}

shoppingListManager()
