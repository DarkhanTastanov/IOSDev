import Foundation
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