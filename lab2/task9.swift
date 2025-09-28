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
    return b == 0 ? nil : a / b
}

let a = 10.0, b = 5.0, op = "+"
switch op {
case "+": print(add(a, b))
case "-": print(subtract(a, b))
case "*": print(multiply(a, b))
case "/": print(divide(a, b) ?? "Error: division by zero")
default: print("Invalid operator")
}
