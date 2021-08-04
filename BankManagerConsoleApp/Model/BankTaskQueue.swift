//
//  BankTaskQueue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/08/03.
//

import Foundation

struct BankTaskQueue {
    let identify: Bank.BusinessType
    let clerks: [BankClerk]
    private let dispatchQueue: DispatchQueue
    private let dispatchSemaphore: DispatchSemaphore
    
    func matchingClerkWith(customer: Customer?, afterFunction: @escaping () -> Void) {
        dispatchSemaphore.wait()
        let targetClerk = clerks.filter { bankClerk in
            return bankClerk.isWorking == false
        }[0]

        targetClerk.ready()

        dispatchQueue.async {
            targetClerk.doTask(about: customer)
            dispatchSemaphore.signal()
            afterFunction()
        }
    }
    
    init(identify: Bank.BusinessType, clerks: [BankClerk]) {
        self.identify = identify
        self.clerks = clerks
        
        dispatchQueue = DispatchQueue(label: identify.description, attributes: .concurrent)
        dispatchSemaphore = DispatchSemaphore(value: Int(identify.clerkNumber))
    }
}
