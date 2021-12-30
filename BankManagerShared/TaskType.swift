import Foundation

enum TaskType: CaseIterable, CustomStringConvertible {
    case deposit
    case loan

    static func randomElement() -> TaskType? {
        return TaskType.allCases.randomElement()
    }

    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
