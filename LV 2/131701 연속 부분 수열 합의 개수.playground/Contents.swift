func solution(_ elements:[Int]) -> Int {
    let arr = elements + elements[0..<elements.count]
    var answer = Set<Int>()
    var start = 0
    var end = 0
    var sum = 0
    
    while end < arr.count {
        sum += arr[end]
        answer.insert(sum)
        end += 1
        
        if end == arr.count - 1 ||
            end - start == elements.count {
            sum = 0
            start += 1
            end = start
        }
    }
    return answer.count
}
