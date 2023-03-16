func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer = ""
    let skipArr = Array(skip).map{ UnicodeScalar( $0.asciiValue! ) }
    var cnt = 0
    
    for c in s {
        var next = c.asciiValue!
        var isFirst = true
        while cnt != index {
            let al = UnicodeScalar(next)
            
            cnt += skipArr.contains(al) || isFirst ? 0 : 1
            isFirst = false
            next += cnt == index ? 0 : 1
            if next > 122 {
                next = 97
            }
        }
        cnt = 0
        answer += UnicodeScalar(next).description
    }
    
    return answer
}
