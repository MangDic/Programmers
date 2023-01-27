import Foundation

import Foundation

func solution(_ s:String) -> [Int] {
        var binaryCnt = 0
        var zeroCnt = 0
        var changedStr = s
        
        while changedStr != "1" {
            binaryCnt += 1
            var temp = ""
            for c in changedStr {
                if c == "0" {
                    zeroCnt += 1
                }
                else {
                    temp += "1"
                }
            }
            changedStr = String(temp.count, radix: 2)
        }
        return [binaryCnt, zeroCnt]
    }
