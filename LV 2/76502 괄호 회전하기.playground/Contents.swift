func solution(_ s:String) -> Int {
    var answer = 0
    var currentStr = ""
    
    for _ in 0..<s.count {
        if currentStr == "" {
            currentStr = s
        }
        
        let first = currentStr.first!
        currentStr.removeFirst()
        currentStr.append(first)
        
        var stack = [String]()
        
        currentStr.forEach { c in
            if String(c) == "[" || String(c) == "(" || String(c) == "{" {
                stack.append(String(c))
            }
            else {
                if let last = stack.last {
                    if last == "[" && String(c) == "]" {
                        stack.removeLast()
                    }
                    else if last == "(" && String(c) == ")" {
                        stack.removeLast()
                    }
                    else if last == "{" && String(c) == "}" {
                        stack.removeLast()
                    }
                }
                else {
                    stack.append("-1")
                }
            }
        }
        answer += stack.isEmpty ? 1 : 0
    }
    return answer
}
