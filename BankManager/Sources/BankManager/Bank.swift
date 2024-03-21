//
//  Bank.swift
//
//
//  Created by Jaehun Lee on 3/21/24.
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
                print("업무 개시")
                sleep(UInt32(0.7))
                print("업무 완료")
                concurrentLimitingSemaphore.signal()
            }
        }
    }
}
