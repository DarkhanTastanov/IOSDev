import Foundation

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