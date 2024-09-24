import Foundation

func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet = Set<Character>()
    
    for char in text {
        if characterSet.contains(char) {
            return false
        }
        characterSet.insert(char)
    }
    
    return true
}
print(hasUniqueCharacters("Swift"))
print(hasUniqueCharacters("Darkhan"))
print(hasUniqueCharacters("Hello"))
