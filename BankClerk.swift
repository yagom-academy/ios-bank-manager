//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

enum Task {
    case reviewDocument
    case excuteLoan
    
    var time: useconds_t {
        switch self {
        case .excuteLoan:
            return 300000
        case .reviewDocument:
            return 300000
        }
    }
}

final class BankClerk {
    let bankWindowNumber: Int
    var isWorking: Bool = false
    var queue: DispatchQueue
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
        queue = DispatchQueue(label: "\(bankWindowNumber)")
    }
    
    func performTask(task: Task) {
        usleep(task.time)
    }
    
    func serveCustomers(customer: Customer, group: DispatchGroup) {
        self.isWorking = true
        BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.grade.description, customerTask: customer.task.description, state: .start)
        queue.async(group: group) {
            if customer.task == .loan {
                self.performTask(task: .reviewDocument)
                Headquarter.common.judgeLoan(customer: customer)
                self.performTask(task: .excuteLoan)
            } else {
                usleep(customer.task.rawValue)
            }
            BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.grade.description, customerTask: customer.task.description, state: .completion)
            self.isWorking = false
        }
    }
}
