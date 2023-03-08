import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var av = a - 1
    var bv = b - 1
    var cnt = 0
    
    while av != bv {
        if av / 2 == bv / 2 {
            return cnt + 1
        }
        av /= 2
        bv /= 2
        cnt += 1
    }
    return cnt
}
