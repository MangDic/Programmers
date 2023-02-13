func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    
    let available = w * 2 + 1
    var start = 0
    
    for station in stations {
        if station + w - 1 >= start && station - w - 1 <= start {
            start = station + w
        }
        
        else if station - w - 1 > start {
            let cnt = station - w - start - 1
            answer += cnt / available
            answer += cnt % available == 0 ? 0 : 1
            start = station + w
        }
    }
    
    start = start > n ? n : start
    
    var cnt = n - start
    cnt += n < start ? 1 : 0
    
    answer += cnt / available
    answer += cnt % available == 0 ? 0 : 1
    
    return answer
}
