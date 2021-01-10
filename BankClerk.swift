//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

class BankClerk {
    let windowNumber: Int
    var isWorking: Bool = false
    var queue: DispatchQueue
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
        queue = DispatchQueue(label: "\(windowNumber)")
    }
    
    func serveCustomers(customer: Customer, group: DispatchGroup) {
        self.isWorking = true
        BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.customerClass.description, customerTask: customer.task.description, state: .start)
        queue.async(group: group) {
            usleep(customer.task.rawValue)
            BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.customerClass.description, customerTask: customer.task.description, state: .completion)
            self.isWorking = false
        }
    }
}
