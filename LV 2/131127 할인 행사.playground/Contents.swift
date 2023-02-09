func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    var wantDic = [String: Int]()
    
    for (i, w) in want.enumerated() {
        wantDic[w] = number[i]
    }
    
    for i in 0..<10 {
        if wantDic[discount[i]] != nil {
            wantDic[discount[i]]! -= 1
        }
    }
    
    for i in 9..<discount.count {
        if i > 9 {
            if wantDic[discount[i - 10]] != nil {
                wantDic[discount[i - 10]]! += 1
            }
            if wantDic[discount[i]] != nil {
                wantDic[discount[i]]! -= 1
            }
        }
        
        var isAvailable = true
        for v in wantDic.values {
            if v > 0 {
                isAvailable = false
                break
            }
        }
        answer += isAvailable ? 1 : 0
    }
    
    return answer
}
