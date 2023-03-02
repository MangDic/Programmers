import Foundation

func solution(_ s:String) -> [Int] {
    var arr = [[String]]()
    var temp = [String]()
    var strTemp = ""
    
    for c in s {
        if c == "{" {
            continue
        }
        else if c == "," {
            if strTemp != "" {
                temp.append(strTemp)
                strTemp = ""
            }
            continue
        }
        else if c == "}" {
            if !temp.isEmpty {
                temp.append(strTemp)
                arr.append(temp)
            }
            else if strTemp != "" {
                arr.append([strTemp])
            }
            
            temp = []
            strTemp = ""
            continue
        }
        strTemp += String(c)
    }
    
    arr = arr.sorted(by: { $0.count < $1.count })
    var visit = [String: Void]()
    var answer = [Int]()
    for a in arr {
        for n in a {
            if visit[String(n)] != nil {
                
            }
            else {
                visit[String(n)] = ()
                answer.append(Int(n)!)
            }
        }
    }
    
    return answer
}
