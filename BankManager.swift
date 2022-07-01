//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class BankManager {
    private var waitingNumber: Int = 0
    private var customerQueue: Queue<Customer>
    
    var isNotEmptyQueue: Bool {
        if customerQueue.isEmpty() {
            waitingNumber = 0
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
    
    func transferTask() -> (count: Int, task: String) {
        guard let task = customerQueue.dequeue()?.task else {
            return (0, "Erro")
        }
        waitingNumber += 1
        return (waitingNumber, task)
    }
}

