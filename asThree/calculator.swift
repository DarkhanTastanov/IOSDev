import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil
    }
    return a / b
}

func calculator() {
    var shouldContinue = true

    while shouldContinue {
        print("Enter the first number:")
        guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
            print("Please enter a valid number.")
            continue
        }

        print("Enter the second number:")
        guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
            print("Please enter a valid number.")
            continue
        }

        print("(+, -, *, /) or type 'exit' to quit:")
        if let operation = readLine()?.lowercased() {
            switch operation {
            case "+":
                print("Result: \(add(firstNumber, secondNumber))")
            case "-":
                print("Result: \(subtract(firstNumber, secondNumber))")
            case "*":
                print("Result: \(multiply(firstNumber, secondNumber))")
            case "/":
                if let result = divide(firstNumber, secondNumber) {
                    print("Result: \(result)")
                } else {
                    print("Error: Division by zero is possible")
                }
            case "exit":
                shouldContinue = false
                print("bb")
            default:
                print("Please enter +, -, *, / or 'exit'.")
            }
        }
    }
}

calculator()