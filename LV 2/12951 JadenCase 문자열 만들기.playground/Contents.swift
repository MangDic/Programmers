func solution(_ s:String) -> String {
    var answer = ""
    var currentChar = ""
    
    for (row, c) in s.enumerated() {
        answer += row == 0 || currentChar == " " ? c.uppercased() : c.lowercased()
                    
        currentChar = String(c)
    }
    return answer
}
