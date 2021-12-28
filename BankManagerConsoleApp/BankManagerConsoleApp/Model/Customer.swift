import Foundation

enum Banking: CaseIterable {
    case loan
    case deposit
    
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
}

struct Customer {
    let banking: Banking
    let waitingNumber: Int
    
    init(banking: Banking = .random, waitingNumber: Int) {
        self.banking = banking
        self.waitingNumber = waitingNumber
    }
}
