import Foundation

func solution(_ s:String) -> String {
    var strs = s.split(separator: " ")
        .map { $0.forEach { c in
        String(c).lowercased()
    }}
    
    for str in strs {
        let t = String(str)
    }
        //.map { String($0[0]).uppercased() }
    
    var answer = ""
    
    for str in strs {
        print(str)
    }
    return ''
}
