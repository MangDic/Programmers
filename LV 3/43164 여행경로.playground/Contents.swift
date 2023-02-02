struct Ticket {
    var start: String
    var end: String
    var arr: [String]
    var visit: [Bool]
}

func solution(_ tickets:[[String]]) -> [String] {
    var queue = [Ticket]()
    var answer = [String]()
    for (i, ticket) in tickets.enumerated() {
        if ticket[0] == "ICN" {
            var visit = Array.init(repeating: false,
                                   count: tickets.count + 1)
            visit[i] = true
            let t = Ticket(start: ticket[0], end: ticket[1], arr: [ticket[0], ticket[1]], visit: visit)
            queue.append(t)
        }
    }
    
    while !queue.isEmpty {
        let ticket = queue.first!
        queue.removeFirst()
        
        if ticket.arr.count == tickets.count + 1 {
            if answer.isEmpty {
                answer = ticket.arr
            }
            else {
                if answer.joined() > ticket.arr.joined() {
                    answer = ticket.arr
                }
            }
            continue
        }
        for (i, t) in tickets.enumerated() {
            if ticket.end == t[0],
               !ticket.visit[i] {
                var arr = ticket.arr
                var visit = ticket.visit
                
                arr.append(t[1])
                visit[i] = true
                
                let next = Ticket(start: t[0], end: t[1], arr: arr, visit: visit)
                queue.append(next)
            }
        }
    }
    
    return answer
}
