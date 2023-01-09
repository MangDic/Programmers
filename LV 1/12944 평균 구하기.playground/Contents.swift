import Foundation

func solution(_ arr:[Int]) -> Double {
    var sum = 0
    for num in arr {
        sum += num
    }
    // reduce를 사용해서 같은 값을 얻을 수 있습니다. arr.reduce(0, +)
    return Double(sum)/Double(arr.count)
}
