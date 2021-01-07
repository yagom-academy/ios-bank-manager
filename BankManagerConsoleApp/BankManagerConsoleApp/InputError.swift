import Foundation

enum InputError: Error {
    case wrongInput
    case noInput
    case unknown
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 입력하세요!"
        case .noInput:
            return "입력값이 없습니다. 다시 입력하세요!"
        case .unknown:
            return "알 수 없는 입력값입니다. 다시 입력하세요!"
        }
    }
}
