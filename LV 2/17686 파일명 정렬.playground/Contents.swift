struct FileData {
    let head: String
    let num: String
    let value: String
}

func solution(_ files:[String]) -> [String] {
    var arr = [FileData]()
    
    for file in files {
        var startNum = -1
        var endNum = -1
        var endHead = 0
        for (i, c) in file.enumerated() {
            if let _ = Int(String(c)) {
                if startNum == -1 {
                    endHead = i - 1
                    startNum = i
                    endNum = i
                }
                else {
                    endNum = i
                }
            }
            else if startNum != -1 {
                break
            }
        }
        if endNum - startNum > 4 {
            endNum = startNum + 4
        }
        let temp = Array(file)
        let head = String(temp[0...endHead])
        var number = String(temp[startNum...endNum])
        
        for _ in 0..<5-number.count {
            number = "0" + number
        }
        
        arr.append(FileData(head: head, num: number, value: file))
    }
    
    let t = arr.sorted(by: { a, b in
        if a.head.lowercased() == b.head.lowercased() {
            return a.num < b.num
        }
        return a.head.lowercased() < b.head.lowercased()
    })
    
    let answer = t.map { $0.value }
    
    return answer
}
