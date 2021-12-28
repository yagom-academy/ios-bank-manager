import Foundation

struct BankManager {
    let assignedTask: BankTask
    
    var taskHandlingTime: Double {
        switch self.assignedTask {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    init(assignedTask: BankTask) {
        self.assignedTask = assignedTask
    }
}
