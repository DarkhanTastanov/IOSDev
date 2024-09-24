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