//
//  BankHeadquarter.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/12.
//

import Foundation

class BankHeadquarter {
    let queue: DispatchQueue
    static let shared = BankHeadquarter()
    
    private init() {
        self.queue = DispatchQueue.init(label: "loanJudgementQueue")
    }
    
    func approveLoanTask(customer: Customer, semaphore: DispatchSemaphore) {
        print(BankManagerMessage.start.format(customer.waitNumber, customer.priority.description, BankHeadquarter.Task.loanJudgement.rawValue))
        usleep(useconds_t(BankHeadquarter.Task.loanJudgement.timeForTask * Time.second.rawValue))
        print(BankManagerMessage.end.format(customer.waitNumber, customer.priority.description, BankHeadquarter.Task.loanJudgement.rawValue))
        semaphore.signal()
    }
    
    enum Task: String {
        case loanJudgement = "대출심사"
        
        var timeForTask: TimeInterval {
            switch self {
            case .loanJudgement:
                return 0.5
            }
        }
    }
}
