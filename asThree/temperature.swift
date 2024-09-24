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