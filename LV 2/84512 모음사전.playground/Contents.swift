import Foundation

let strArr = ["A", "E", "I", "O" ,"U"]
var visit = Array.init(repeating: false, count: 5)
var target = ""
var answer = 0
var cnt = 0

func dfs(dist: Int, str: String) {
    cnt += dist == 0 ? 0 : 1
    if target == str {
        answer = cnt
        return
    }
    
    for i in 0..<strArr.count {
        if dist == 5 {
            continue
        }
        dfs(dist: dist + 1, str: str + strArr[i])
    }
}

func solution(_ word:String) -> Int {
    target = word
    dfs(dist: 0, str: "")
    return answer
}
