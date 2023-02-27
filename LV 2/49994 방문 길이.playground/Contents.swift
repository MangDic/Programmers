func solution(_ dirs:String) -> Int {
    var answer = 0
    var moveDic = [String:Void]()
    
    var current = (0, 0)
    
    for dir in dirs {
        let old = current
        
        if dir == "L" {
            current.0 -= current.0 == -5 ? 0 : 1
        }
        else if dir == "R" {
            current.0 += current.0 == 5 ? 0 : 1
        }
        else if dir == "U" {
            current.1 -= current.1 == -5 ? 0 : 1
        }
        else {
            current.1 += current.1 == 5 ? 0 : 1
        }
        
        let minX = min(old.0, current.0)
        let maxX = max(old.0, current.0)
        let minY = min(old.1, current.1)
        let maxY = max(old.1, current.1)
        
        let str = "\(minX)\(maxX)\(minY)\(maxY)"
        answer += moveDic[str] != nil || old == current ? 0 : 1
        
        moveDic[str] = ()
    }
    
    return answer
}
