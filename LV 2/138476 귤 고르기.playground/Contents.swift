func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var answer = 0
    var dic = [Int: Int]()
    
    for t in tangerine {
        dic[t] = dic[t] != nil ? dic[t]! + 1 : 1
    }
    
    let sortedDic = dic.sorted(by: { $0.value > $1.value} )
    
    var sum = 0
    for n in sortedDic {
        answer += 1
        sum += n.value % 1234567
        if k % 1234567 <= sum {
            break
        }
    }
    return answer
}
