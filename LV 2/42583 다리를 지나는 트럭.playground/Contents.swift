struct Car {
    var time: Int
    let weight: Int
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    // 진입 가능한 차의 최대 무게
    var available = weight - truck_weights[0]
    var carIndex = 1
    var time = 1
    var queue = [Car]()
    
    queue.append(Car(time: 1, weight: truck_weights[0]))
    
    while !queue.isEmpty {
        let car = queue.first!
        // 진행 시간과 해당 차가 들어갔을 때의 시간 차를 사용 (= 이동거리)
        if time - car.time >= bridge_length {
            // 이동거리가 다리 길이보다 크면 큐에서 빼주고 나간 차의 무게만큼 available 추가
            available += car.weight
            queue.removeFirst()
        }
        
        if carIndex < truck_weights.count {
            let nextCar = truck_weights[carIndex]
            // 진입 가능 무게 및 지나가고 있는 차량 총 개수를 비교
            if available >= nextCar, queue.count < bridge_length {
                queue.append(Car(time: time, weight: nextCar))
                available -= nextCar
                carIndex += 1
            }
        }
        time += 1
    }
    
    return time
}
