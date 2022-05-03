import Foundation

enum TaskType: String, CaseIterable {
    case deposit = "예금업무"
    case loan = "대출업무"
    
    var workTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
