//
//  Bank.swift
//
//
//  Created by Danny, Prism on 3/21/24.
//

import Foundation

struct Bank {
    let numberOfBankClerk: Int
    let bankQueue = BankQueue<Customer>()
    
    private func enqueueTodaysVisitors() {
        (1...Int.random(in: 10...30)).forEach {
            let customer = Customer(waitingNumber: $0)
            bankQueue.enqueue(element: customer)
        }
    }
    
    func commenceBanking() {
        enqueueTodaysVisitors()
        
        let concurrentLimitingSemaphore = DispatchSemaphore(value: numberOfBankClerk)
        
        while !bankQueue.isEmpty {
            concurrentLimitingSemaphore.wait()
            
            guard let customer = bankQueue.dequeue() else { return }
            
            DispatchQueue.global().async {
                print("\(customer.waitingNumber)번 고객 업무 시작")
                sleep(UInt32(0.7))
                print("\(customer.waitingNumber)번 고객 업무 완료")
                concurrentLimitingSemaphore.signal()
            }
        }
    }
}
