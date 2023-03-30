import Foundation

struct Dot: Equatable {
    let x: Int
    let y: Int
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer = [Int]()
    var arr = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    for x in 0..<rows {
        for y in 0..<columns {
            arr[x][y] = x * columns + (y % columns) + 1
        }
    }
    
    for query in queries {
        let startX = query[0] - 1
        let startY = query[1] - 1
        let endX = query[2] - 1
        let endY = query[3] - 1
        var queue = [Dot]()
        // 우
        for y in startY...endY {
            queue.append(Dot(x: startX, y: y))
        }
        // 하
        for x in startX...endX {
            let d = Dot(x: x, y: endY)
            if !queue.contains(where: { $0 == d }) {
                queue.append(d)
            }
        }
        //좌
        for y in stride(from: endY, to: startY, by: -1) {
            let d = Dot(x: endX, y: y)
            if !queue.contains(where: { $0 == d }) {
                queue.append(d)
            }
        }
        //상
        for x in stride(from: endX, to: startX, by: -1) {
            let d = Dot(x: x, y: startY)
            if !queue.contains(where: { $0 == d }) {
                queue.append(d)
            }
        }
        
        let last = queue.last!
        let lastValue = arr[last.x][last.y]
        var minValue = lastValue
        for i in stride(from: queue.count-1, to: -1, by: -1) {
            minValue = min(minValue, arr[queue[i].x][queue[i].y])
            if i == 0 {
                arr[queue[i].x][queue[i].y] = lastValue
            }
            else {
                arr[queue[i].x][queue[i].y] = arr[queue[i-1].x][queue[i-1].y]
            }
        }
        answer.append(minValue)
    }
    
    return answer
}
