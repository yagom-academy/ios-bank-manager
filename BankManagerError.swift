import Foundation

enum InputError: LocalizedError {
    case invalidInput
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "유효하지 않은 입력값입니다."
        }
    }
}
