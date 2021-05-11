//
//  BankDirector.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

class BankDirector {
    let queue = OperationQueue()
    
    var customerQueue: [Task] = []
    
    func createCustomers(numberOfCustomers: Int) {
        queue.maxConcurrentOperationCount = 3
        for waitingNumber in 1...numberOfCustomers {
            let customer = Task(number: waitingNumber, grade: CustomerPriority.random, visitPurpose: TaskType.random)
            customerQueue.append(customer)
        }
        queue.addOperations(customerQueue, waitUntilFinished: true)
    }
}

