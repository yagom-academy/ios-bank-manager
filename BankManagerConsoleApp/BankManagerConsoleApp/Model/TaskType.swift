import Foundation

enum TaskType: String, CaseIterable {
    case deposit = "예금업무"
    case loan = "대출업무"
    
    var workTime: Double {
        switch self {
        case .deposit:
            return WorkTime.deposit
        case .loan:
            return WorkTime.loan
        }
    }
}
