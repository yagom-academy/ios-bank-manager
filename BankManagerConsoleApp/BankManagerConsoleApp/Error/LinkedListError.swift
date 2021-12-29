import Foundation

enum LinkedListError: Error {
    case invalidIndex
    
    var description: String {
        switch self {
        case .invalidIndex:
            return "유효하지 않은 index 입니다."
        }
    }
}
