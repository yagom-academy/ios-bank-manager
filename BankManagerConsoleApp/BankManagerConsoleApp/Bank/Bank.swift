//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

import Foundation

struct Bank {
    private let loanSection: Banker
    private let depositSection: Banker
    private let customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    
//    init(bankersCount: Int) {
//        self.bankers = .init(repeating: Banker(), count: bankersCount)
//    }
    
    func receive(of numberOfCustomer: Int) {
        for waitingNumber in 1...numberOfCustomer {
            guard let customer = Customer(waitingNumber: waitingNumber) else { return }
            
            customerQueue.enqueue(customer)
        }
    }
    
    func work() {
        while customerQueue.isEmpty == false {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            
            switch currentCustomer.businessType {
            case .loan:
                loanBanker.work()
            case .deposit:
                
            }
        }
    }
    
    func startBusiness() {
        var completedJobCount = 0
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while customerQueue.isEmpty == false {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            
            bankers[0].work(for: currentCustomer)
            completedJobCount += 1
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        endBusiness(count: completedJobCount, time: durationTime)
    }
    
    private func endBusiness(count completedJobCount: Int, time durationTime: CFAbsoluteTime) {
        let formattedTime = String(format: "%.2f", durationTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(completedJobCount)명이며, 총 업무시간은 \(formattedTime)초입니다.\n")
    }
}
