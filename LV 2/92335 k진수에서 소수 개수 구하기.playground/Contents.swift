import Foundation

func isPrime(_ n: Int, radix: Int) -> Bool{
    // 제곱근으로 확인하지 않으면 시간초과
    let s = Int(sqrt(Double(n)))
    
    if s < 2 {
        return n == 1 ? false : true
    }
    
    for i in 2...s {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    var answer = 0
    let convert = String(n, radix: k).split(separator: "0").map { Int($0)! }
    
    for n in convert {
        answer += isPrime(n, radix: k) ? 1 : 0
    }
    
    return answer
}
