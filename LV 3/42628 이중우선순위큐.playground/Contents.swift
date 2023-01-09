import Foundation

//class Heap<T: Codable> {
//    var heap = [T]()
//
//    init(data: T) {
//        heap.append(data)
//        heap.append(data)
//    }
////    var left: Int
////    var right: Int
//
//}

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    for operation in operations {
        let temp = operation.split(separator: " ")

        switch String(temp[0]) {
        case "I":
            let num = Int(temp[1])!
            
            queue.append(num)
            queue = queue.sorted(by: >)
            
        default:
            if !queue.isEmpty {
                let operatorNum = Int(temp[1])!
                if operatorNum == 1 {
                    queue.removeFirst()
                }
                else {
                    queue.removeLast()
                }
            }
        }
    }

    return queue.count < 1 ? [0, 0] : [queue.first!, queue.last!]
}
