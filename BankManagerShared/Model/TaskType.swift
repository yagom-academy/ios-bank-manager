import Foundation

enum TaskType: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"

    static func randomElement() -> TaskType {
        return TaskType.allCases.randomElement() ?? .deposit
    }
}
