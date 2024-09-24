import Foundation
func fibonacci(_ n: Int) -> [Int] {
    if n <= 1 {
        return [1]
    }
    
    var fibonacciSequence = [1, 1]
    
    for i in 2..<n {
        let nextNumber = fibonacciSequence[i - 1] + fibonacciSequence[i - 2]
        fibonacciSequence.append(nextNumber)
    }
    
    return fibonacciSequence
}
print(fibonacci(5))