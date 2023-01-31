import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    
    var d1 = 1
    var d2 = 2
    
    if n == 1 || n == 2 {
        return n
    }
    
    for _ in 2..<n {
        answer = d1 + d2
        d1 = d2 % 1234567
        d2 = answer % 1234567
    }
    
    return answer % 1234567
}

// 시간초과 코드
//func solution(_ n:Int) -> Int {
//    var answer = 0
//
//    var queue = [Int]()
//
//    let d1 = 1
//    let d2 = 2
//
//    queue.append(d1)
//    queue.append(d2)
//
//    while !queue.isEmpty {
//        let d = queue.first!
//        queue.removeFirst()
//
//        if d == n {
//            answer += 1
//            answer %= 1234567
//            continue
//        }
//        if d > n {
//            continue
//        }
//
//        queue.append(d + 1)
//        queue.append(d + 2)
//    }
//
//    return answer
//}
