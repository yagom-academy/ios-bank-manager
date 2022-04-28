//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/28.
//

import Foundation

struct Bank {
    private let bankClerkCount: Int
    private let bankWaitingQueue = BankWaitingQueue.init(LinkedList<Customer>())
    private let bankClerk = BankClerk()
    
    init(bankClerkCount: Int) {
        self.bankClerkCount = bankClerkCount
    }
    
    func startWork() {
        let customers = Int.random(in: 10...30)
        for number in 1...customers {
            bankWaitingQueue.enqueue(Customer(numberTicket: number))
        }
        
        let bankWindows = DispatchSemaphore(value: bankClerkCount)
        let group = DispatchGroup()
        let startTime = CFAbsoluteTimeGetCurrent()
     
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return }
            DispatchQueue.global().async(group: group) {
                bankWindows.wait()
                self.bankClerk.processTask(for: customer)
                bankWindows.signal()
            }
        }
        group.wait()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let digit: Double = pow(10, 2)
        
        finishWork(customers, round(durationTime * digit) / digit)
    }
    
    private func finishWork(_ customers: Int, _ totalWorkTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다.")
    }
}
