import Foundation

var aArr: [Int]!
var bArr: [Int]!

func binarySearch(target: Int) -> Int {
    var nearQueue = [Int]()
    var left = 0
    var right = aArr.count-1
    var mid = 0
    while left <= right {
        mid = (left + right) / 2
        nearQueue.append(mid)
        if aArr[mid] >= target {
            right = mid - 1
        }
        else {
            left = mid + 1
        }
    }
    while !nearQueue.isEmpty {
        let num = nearQueue.popLast()!
        if aArr[num] < target {
            mid = num
            break
        }
        mid = num
    }
    return mid
}

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    aArr = a.sorted(by: <)
    bArr = b.sorted(by: >)
    for num in bArr {
        let nearIndex = binarySearch(target: num)
        answer += num > aArr[nearIndex] ? 1 : 0
        print("A: \(aArr[nearIndex]) B: \(num)")
        aArr.remove(at: nearIndex)
    }
    
    return answer
}

solution([5,1,3,7], [2,2,6,8])
