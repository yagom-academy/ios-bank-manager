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
    
    var taskHandlingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
