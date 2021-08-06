//
//  BankTaskQueue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/08/03.
//

import Foundation

struct BusinessQueue {
    let identity: Bank.BusinessType
    let clerks: [BankClerk]
    private let dispatchQueue: DispatchQueue
    private let dispatchSemaphore: DispatchSemaphore
    
    func matchingClerkWith(customer: Customer?, completionHandler: @escaping () -> Void) {
        dispatchSemaphore.wait()
        let targetClerk = clerks.filter { $0.isWorking == false }[0]

        targetClerk.ready()

        dispatchQueue.async {
            targetClerk.doTask(about: customer)
            dispatchSemaphore.signal()
            completionHandler()
        }
    }
    
    init(identity: Bank.BusinessType, clerks: [BankClerk]) {
        self.identity = identity
        self.clerks = clerks
        
        dispatchQueue = DispatchQueue(label: identity.description, attributes: .concurrent)
        dispatchSemaphore = DispatchSemaphore(value: Int(identity.clerkNumber))
    }
}
