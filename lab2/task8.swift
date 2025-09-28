func isPalindrome(_ text: String) -> Bool {
    let filtered = text.lowercased().filter { $0.isLetter }
    return filtered == String(filtered.reversed())
}

print(isPalindrome("test tset"))
