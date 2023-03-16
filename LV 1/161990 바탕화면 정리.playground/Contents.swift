import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let arr = wallpaper.map { Array($0).map { String($0) } }
    var minX = 51
    var minY = 51
    var maxX = -1
    var maxY = -1
    
    for x in 0..<wallpaper.count {
        for y in 0..<wallpaper[x].count {
            if arr[x][y] == "#" {
                minX = min(minX, x)
                minY = min(minY, y)
                maxX = max(maxX, x)
                maxY = max(maxY, y)
            }
        }
    }
    return [minX, minY, maxX + 1, maxY + 1]
}
