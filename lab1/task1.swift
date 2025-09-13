let firstName = "Artur"
let lastName = "Kultyshev"
let birthYear = 2004
let currentYear = 2025
var age = currentYear - birthYear
var isStudent = true
var height = 1.93
let university = "KBTU"
let speciality = "Computer Systems and Software"
var 😎 = "😎"
var 🙂 = "Hello!"

var hobby = "Coding"
var numberOfHobbies = 5
var favoriteNumber = Int.random(in: 1...10)
var isHobbyCreative = false

var isStudentResult: String
var isHobbyCreativeResult: String

if isStudent{
    isStudentResult = "I am currently a student of \(university) university. My speciality is \(speciality)."
} else{
    isStudentResult = "I am not currently a student."
}

if isHobbyCreative {
    isHobbyCreativeResult = "creative"
} else {
    isHobbyCreativeResult = "not creative"
}


var text = """
\(🙂) My name is \(lastName) \(firstName).
I am \(age) years old, born in \(birthYear).
My height is \(height).
\(isStudentResult)

I enjoy \(hobby), which is \(isHobbyCreativeResult) hobby. 
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber)\(😎).
"""

print(text)
