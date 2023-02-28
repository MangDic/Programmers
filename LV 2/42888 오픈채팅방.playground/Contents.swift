struct Chat {
    var uid: String
    var status: String
}

func solution(_ record:[String]) -> [String] {
    var answer = [String]()
    var arr = [Chat]()
    var nickDic = [String: String]()
    
    for r in record {
        let temp = r.split(separator: " ").map { String($0) }
        if temp[0] == "Change" {
            nickDic[temp[1]] = temp[2]
        }
        else {
            if temp.count == 3 {
                nickDic[temp[1]] = temp[2]
            }
            
            arr.append(Chat(uid: temp[1],
                            status: temp[0]))
        }
    }
    
    for r in arr {
        let discription = r.status == "Enter" ? "님이 들어왔습니다." : "님이 나갔습니다."
        answer.append(nickDic[r.uid]! + discription)
    }
    
    return answer
}
