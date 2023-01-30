import Foundation

func solution(_ n:Int) -> Int {
    var cnt = 0
    
    if n == 0 || n == 1 {
        return n
    }
    
    var left = 0
    var right = 1
    var answer = 0
    
    while cnt != n-1 {
        answer = (left % 1234567) + (right % 1234567)
        left = right
        right = answer
        cnt += 1
    }
    return answer
}
