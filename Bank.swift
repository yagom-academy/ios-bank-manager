//
//  BankManager.swift
//  Created by yagom.
//  Copyright Donnie, Safari. All rights reserved.
//

import Foundation

struct Bank {
    let bankClerkCount: Int
    let bankWaitingQueue = BankWaitingQueue.init(LinkedList<Customer>())
    
    init(bankClerkCount: Int) {
        self.bankClerkCount = bankClerkCount
    }
    
    func open() {
        let customers = Int.random(in: 10...30)
        
        for number in 1...customers {
            bankWaitingQueue.enqueue(Customer(numberTicket: number))
        }
        
        let bankWindows = DispatchSemaphore(value: bankClerkCount)
        let group = DispatchGroup()
        
        while !bankWaitingQueue.isEmpty {
            DispatchQueue.global().async(group: group) {
                bankWindows.wait()
                guard let customer = bankWaitingQueue.dequeue() else {
                    bankWindows.signal()
                    return
                }
                BankClerk().processTask(for: customer)
                bankWindows.signal()
            }
        }
        group.wait()
        print("업무가 마감되었습니다.")
    }
}
