func solution(_ s:String) -> Bool
{
    if s.count % 2 == 1 || s.first == ")" {
        return false
    }
    var cnt = 0
    
    for c in s {
        cnt += c == "(" ? 1 : -1
        
        if cnt < 0 {
            return false
        }
    }
    
    return cnt == 0
}
