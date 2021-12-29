import Foundation

enum Banking: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    static var random: Banking {
        return .allCases.randomElement() ?? .loan
    }
    
    var speed: TimeInterval {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    var description: String {
        return self.rawValue
    }
}

struct Customer {
    let banking: Banking
    let waitingNumber: Int
    
    init(banking: Banking = .random, waitingNumber: Int) {
        self.banking = banking
        self.waitingNumber = waitingNumber
    }
}
