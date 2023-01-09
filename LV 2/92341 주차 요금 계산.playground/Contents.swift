import Foundation

// fees - 0: 기본 시간, 1: 기본 요금, 2: 단위 시간, 3: 단위 요금
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var answer = [Int]()
    // key: 차량 번호, value: (입차/출차 시간)
    var recordDic = [String: [Int]]()
    var keyArr = [String]()
    
    // 딕셔너리에 시간을 분으로 변환한 값들을 넣어줍니다(append).
    for record in records {
        // 시각, 차량 번호, 내역으로 나눠서 temp에 넣습니다.
        let temp = record.split(separator: " ")
        let key = String(temp[1])
        // 시각을 다시 :로 나눠서 분으로 변환한 값을 딕셔너리에 넣어줍니다.
        let time = temp[0].split(separator: ":")
        let timeValue = Int(time[0])!*60 + Int(time[1])!
        if recordDic[key] != nil {
            recordDic[key]!.append(timeValue)
        }
        else {
            recordDic[key] = [timeValue]
            keyArr.append(key)
        }
    }
    // 딕셔너리의 key값은 랜덤으로 가져오기 때문에 오름차순으로 정렬합니다.
    let sortedKeyArr = keyArr.sorted(by: <)
    
    for key in sortedKeyArr {
        var data = recordDic[key]!
        // 배열의 원소 개수가 홀수라면 입차 후 출차하지 않은 차량이 있는 것입니다.
        if data.count % 2  != 0 {
            // 따라서 마지막 시간인 23:59분을 분으로 변환하여 임의로 넣어줍니다.
            data.append(23 * 60 + 59)
        }
        var sum = 0
        for index in 0..<data.count {
            // index % 2 == 0 : 입차, index % 2 == 1 : 출차
            if index % 2 == 0 {
                sum += data[index + 1] - data[index]
            }
        }
        // 기본 시간보다 작다면 기본 요금을 append 합니다.
        if sum <= fees[0] {
            answer.append(fees[1])
            continue
        }
        // 단위 요금은 올림으로 계산하기 때문에 나머지 연산자로 판단합니다.
        var f = (sum - fees[0]) % fees[2] == 0 ? 0 : 1
        let fee = fees[1] + ((sum - fees[0]) / fees[2] + f) * fees[3]

        answer.append(fee)
    }
    return answer
}

solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])
