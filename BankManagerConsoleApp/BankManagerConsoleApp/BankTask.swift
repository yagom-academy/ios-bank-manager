import Foundation

enum BankTask: CaseIterable {
    case deposit
    case loan

    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
