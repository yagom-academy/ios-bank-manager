//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

final class BankClerk {
    let bankWindowNumber: Int
    var isWorking: Bool = false
    var queue: DispatchQueue
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
        queue = DispatchQueue(label: "\(bankWindowNumber)")
    }
    
    func serveCustomers(customer: Customer, group: DispatchGroup) {
        self.isWorking = true
        BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.grade.description, customerTask: customer.task.description, state: .start)
        queue.async(group: group) {
            usleep(customer.task.rawValue)
            BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.grade.description, customerTask: customer.task.description, state: .completion)
            self.isWorking = false
        }
    }
}
