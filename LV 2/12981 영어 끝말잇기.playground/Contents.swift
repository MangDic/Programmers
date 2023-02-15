import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var last = words[0].last!
    var queue: [String] = [words[0]]
    var cycle = 1
    
    for (index, word) in words.enumerated() {
        if index == 0 {
            continue
        }
        cycle += index % n == 0 ? 1 : 0
        let first = word.first!
        if first != last || queue.contains(word) {
            return [(index % n) + 1, cycle]
        }
        queue.append(word)
        last = word.last!
    }
    return [0, 0]
}
