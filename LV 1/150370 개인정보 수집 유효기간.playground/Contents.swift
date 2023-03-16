import Foundation

/// 날짜 스트링을 일수로 변환합니다.
func convertToDay(_ str: String) -> Int {
    let temp = str.split(separator: ".").map { String($0) }
    return (Int(temp[0])! * 12 * 28) + (Int(temp[1])! * 28 ) + Int(temp[2])!
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer = [Int]()
    
    let temp = today.split(separator: ".").map { String($0) }
    let todayValue = convertToDay(today)
    // 약관종류 : 보관일수
    var termDic = [String: Int]()
    // 달로 받기 때문에 일수로 변경합니다.
    for term in terms {
        let temp = term.split(separator: " ").map { String($0) }
        termDic[temp[0]] = Int(temp[1])! * 28
    }
    
    for (i, privacy) in privacies.enumerated() {
        let temp = privacy.split(separator: " ").map { String($0) }
        let dateValue = convertToDay(temp[0])
        
        if termDic[temp[1]]! <= todayValue - dateValue {
            answer.append(i + 1)
        }
    }
    return answer
}
