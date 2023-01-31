func solution(_ numbers:[Int]) -> String {
    let sortedArr = numbers.map { String($0) }.sorted(by: {
        return $0 + $1 > $1 + $0
    })
    
    return Int(sortedArr.first!)! == 0 ? "0" : sortedArr.reduce("", { $0 + $1} )
}
