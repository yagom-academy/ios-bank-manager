//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class BankManager {
    private var waitingNumber: Int = 0
    private var customerQueue: Queue<Customer>
    
    var isEmptyQueue: Bool {
        if customerQueue.isEmpty() {
            return true
        } else {
            return false
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
    
    func transferTask() -> String {
        guard let task = customerQueue.dequeue()?.task else {
            return "ERROR: FAILURE"
        }
        return task
    }
}

