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
    
    func commenceBanking() {
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
