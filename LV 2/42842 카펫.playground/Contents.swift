import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var n = 0
    while n < yellow {
        n += 1
        if yellow % n != 0 {
            continue
        }
        let width = yellow / n
        
        let count = 4 + (width * 2) + (n * 2)
        if count == brown {
            return [width + 2, n + 2]
        }
    }
    
    return []
}
