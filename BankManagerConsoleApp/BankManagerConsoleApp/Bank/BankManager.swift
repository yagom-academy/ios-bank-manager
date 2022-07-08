//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

final class BankManager {
    private var waitingNumber: Int = 0
    private var customerQueue: Queue<Customer>
    
    var isNotEmptyQueue: Bool {
        if customerQueue.isEmpty() {
            return false
        } else {
            return true
        }
    }
    
    init() {
        customerQueue = Queue<Customer>()
    }

    func appendCustomerToQueue(from customers: [Customer]) {
        for customer in customers {
            customerQueue.enqueue(inputData: customer)
        }
    }
    
    func fetchTask() throws -> (count: Int, task: BankTask) {
        guard let task = customerQueue.dequeue()?.task else {
            throw BankError.emptyError
        }
        waitingNumber += 1
        return (waitingNumber, task)
    }
    
    func resetWaitingNumber() {
        waitingNumber = 0
    }
}
