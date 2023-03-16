import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportHistory = [String: [String]]()
    var reportResult = [String: Int]()
    
    for r in report {
        let temp = r.split(separator: " ").map { String($0) }
        
        if reportHistory[temp[0]] == nil {
            reportHistory[temp[0]] = [String]()
        }
        
        if !reportHistory[temp[0]]!.contains(temp[1]) {
            reportHistory[temp[0]]!.append(temp[1])
            if reportResult[temp[1]] != nil {
                reportResult[temp[1]]! += 1
            }
            else {
                reportResult[temp[1]] = 1
            }
        }
    }
    
    var answer = Array(repeating: 0, count: id_list.count)
    
    for (i, id) in id_list.enumerated() {
        if let list = reportHistory[id] {
            for n in list {
                answer[i] += reportResult[n]! >= k ? 1 : 0
            }
        }
    }
    return answer
}
