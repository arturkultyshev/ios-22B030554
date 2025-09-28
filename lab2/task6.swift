func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    if n == 1 {
        return [0]
    }
    var seq = [0, 1]
    while seq.count < n {
        seq.append(seq[seq.count - 1] + seq[seq.count - 2])
    }
    return seq
}

print(fibonacci(7))
