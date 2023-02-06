func solution(_ A:[Int], _ B:[Int]) -> Int {
    let sa = A.sorted(by: <)
    let sb = B.sorted(by: >)
    
    var sum = 0
    for i in 0..<A.count {
        sum += sa[i] * sb[i]
    }
    
    return sum
}
