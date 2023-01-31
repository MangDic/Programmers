import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    var queue = [String]()
    
    cities.forEach { city in
        // cities는 대소문자 구분 x
        let low = city.lowercased()
        answer += queue.contains(low) ? 1 : 5
        // LRU - 캐싱 적중이라면 해당 요소를 맨 뒤에 추가
        if let index = queue.firstIndex(of: low) {
            queue.remove(at: index)
            queue.append(low)
        }
        // 적중하지 못했다면 맨 앞 제거 후 맨 뒤에 city 추가
        else if cacheSize != 0 {
            if queue.count == cacheSize {
                queue.removeFirst()
            }
            queue.append(low)
        }
    }
    return answer
}
