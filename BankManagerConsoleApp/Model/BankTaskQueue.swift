//
//  BankTaskQueue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/08/03.
//

import Foundation

struct BankTaskQueue {
    let identify: Bank.Job
    let dispatchQueue: DispatchQueue
    let dispatchSemaphore: DispatchSemaphore
    let clerks: [BankClerk]
    
    func matchingClerkWith(customer: Customer?, afterFunction: @escaping () -> Void) {
        var targetClerk = clerks.filter { bankClerk in
            return bankClerk.isWorking == false
        }[0]
        
        dispatchSemaphore.wait()
        dispatchQueue.async {
            targetClerk.startTask(about: customer)
            dispatchSemaphore.signal()
            afterFunction()
        }
    }
}
