func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    for skill_tree in skill_trees {
        var queue = skill
        var isAvailable = true
        
        for c in skill_tree {
            if queue.isEmpty {
                break
            }
            
            if queue.contains(String(c)) {
                if queue.first == c {
                    queue.removeFirst()
                }
                else {
                    isAvailable = false
                    break
                }
            }
        }
        
        answer += isAvailable ? 1 : 0
    }
    return answer
}
