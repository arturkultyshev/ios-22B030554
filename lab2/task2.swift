func isPrime(_ number: Int) -> Bool{
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for i in 1...100 {
    if isPrime(i) {
        print(i)
    }
}
