import Foundation

// 순서대로 currentDic에 값이 없으면 해당 index에는 -1 append
// 그리고 currentDic에 현재 Character와 index를 넣어줍니다
// 값이 존재한다면 currentDic에 저장되어 있는 인덱스와 현재 인덱스를 뺀 값을(가장 가까운) append
// 그리고 현재 인덱스 값으로 갱신합니다.
func solution(_ s:String) -> [Int] {
    var currentDic = [Character:Int]()
    // 18번에서 런타임 에러가 발생해서 배열 사이즈를 지정해봤는데 성공!
    var answer = Array.init(repeating: 0, count: 10000)
    // enumerated로 index와 Character 함께 사용
    for (index, c) in s.enumerated() {
        answer[index] = currentDic[c] != nil ? index - currentDic[c]! : -1
        currentDic[c] = index
    }
    // 배열 사이즈를 10000으로 지정했으므로 s의 카운트 만큼 잘라서 리턴합니다.
    return Array(answer.prefix(s.count))
}
