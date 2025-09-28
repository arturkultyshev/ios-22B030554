func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}
func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273
}
func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}
func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273
}

let value = 25.0
let unit = "C"

if unit == "C" {
    print("Fahrenheit:", celsiusToFahrenheit(value))
    print("Kelvin:", celsiusToKelvin(value))
} else if unit == "F" {
    let c = fahrenheitToCelsius(value)
    print("Celsius:", с)
    print("Kelvin:", celsiusToKelvin(c))
} else if unit == "K" {
    let c = kelvinToCelsius(value)
    print("Celsius:", c)
    print("Fahrenheit:", celsiusToFahrenheit(c))
}
