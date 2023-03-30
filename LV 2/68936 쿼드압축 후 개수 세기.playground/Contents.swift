struct Dot: Hashable {
    let x: Int
    let y: Int
}

func solution(_ arr:[[Int]]) -> [Int] {
    var startX = 0
    var startY = 0
    var n = arr.count
    var zeroCnt = 0
    var oneCnt = 0
    var isAvailable = true
    var changedHistory = [Dot: Void]()
    
    for a in arr {
        for b in a {
            zeroCnt += b == 0 ? 1 : 0
            oneCnt += b == 1 ? 1 : 0
        }
    }
    
    while n != 1 {
        var temp = [(Int, Int)]()
        
        let startNum = arr[startX][startY]
        
        for x in startX..<startX+n {
            for y in startY..<startY+n {
                if arr[x][y] != startNum || changedHistory[Dot(x: x, y: y)] != nil {
                    isAvailable = false
                }
                temp.append((x, y))
            }
        }
        
        if isAvailable {
            if startNum == 0 {
                zeroCnt -= (n * n - 1)
            }
            else {
                oneCnt -= (n * n - 1)
            }
            
            for t in temp {
                changedHistory[Dot(x: t.0, y: t.1)] = ()
            }
        }
        
        isAvailable = true
        
        startX += n
        if startX >= arr.count {
            startX = 0
            startY += n
        }
        if startY >= arr.count {
            startX = 0
            startY = 0
            n /= 2
        }
    }
    return [zeroCnt, oneCnt]
}
