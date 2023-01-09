import Foundation


func solution(_ t:String, _ p:String) -> Int {
    var answer = 0
    
    for i in 0..<t.count - p.count + 1 {
        // i 만큼 앞에서 날리고, p의 카운트 만큼 가져옵니다
        let str = t.dropFirst(i).prefix(p.count)
        if str <= p {
            answer += 1
        }
    }
    return answer
}

// 여기서는 상당히 비효율적인 투포인터
//func solution(_ t:String, _ p:String) -> Int {
//    var answer = 0
//
//    let pCount = p.count
//
//    let tCharArr = Array(t)
//
//    var left = 0
//    var right = 0
//
//    var str = ""
//
//    while left <= right {
//        if right == t.count {
//            break
//        }
//        if right >= t.count {
//            break
//        }
//
//        str += String(tCharArr[right])
//
//        if str.count > p.count {
//            str.removeFirst()
//        }
//
//        if str.count == p.count {
//            if Int(str)! <= Int(p)! {
//                answer += 1
//            }
//        }
//        right += 1
//    }
//    return answer
//}
