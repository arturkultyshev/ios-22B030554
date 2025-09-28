let students = ["test1": 90, "test2": 75, "test3": 60]
let scores = Array(students.values)
let average = scores.reduce(0, +) / scores.count
let maxScore = scores.max()!
let minScore = scores.min()!

print("Average:", average, "Max:", maxScore, "Min:", minScore)

for (name, score) in students {
    let status = score >= average ? "above" : "below"
    print("\(name): \(score) (\(status) average)")
}
