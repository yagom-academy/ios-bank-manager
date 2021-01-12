//
//  BankHeadquarter.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/12.
//

import Foundation

class BankHeadquarter {
    let queue: DispatchQueue
    let second: Double = 1_000_000
    static let shared = BankHeadquarter()
    
    private init() {
        self.queue = DispatchQueue.init(label: "loanJudgementQueue")
    }
    
    func approveLoanTask(customer: Customer) {
        queue.sync { 
            print("\(BankManangerMessage.start)".format(customer.waitNumber, customer.priority.description, BankTask.loanJudgement.rawValue))
            usleep(useconds_t(BankTask.loanJudgement.timeForTask * second))
            print("\(BankManangerMessage.end)".format(customer.waitNumber, customer.priority.description, BankTask.loanJudgement.rawValue))
        }
    }
}
