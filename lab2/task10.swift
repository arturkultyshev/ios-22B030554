func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: Set<Character> = []
    for char in text {
        if seen.contains(char) {
            return false
        }
        seen.insert(char)
    }
    return true
}

print(hasUniqueCharacters("test"))
print(hasUniqueCharacters("tesa"))
