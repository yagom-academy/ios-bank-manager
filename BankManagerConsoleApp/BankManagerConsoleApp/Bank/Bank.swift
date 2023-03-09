//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

import Foundation

struct Bank {
    private var loanSection: BusinessSection
    private var depositSection: BusinessSection
    private let customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    
    init() {
        loanSection = BusinessSection(
            queueName: "대출창구",
            businessType: .loan,
            numberOfBankers: 1
        )
        depositSection = BusinessSection(
            queueName: "예금창구",
            businessType: .deposit,
            numberOfBankers: 2
        )
    }
    
    func receive(of numberOfCustomer: Int) {
        for waitingNumber in 1...numberOfCustomer {
            guard let customer = Customer(waitingNumber: waitingNumber) else { return }
            
            customerQueue.enqueue(customer)
        }
    }
    
    mutating func work() {
        while !customerQueue.isEmpty {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            
            switch currentCustomer.businessType {
            case .loan:
                loanSection.work(for: currentCustomer)
                loanSection.addJobCount()
            case .deposit:
                depositSection.work(for: currentCustomer)
                depositSection.addJobCount()
            }
        }
    }
    
    mutating func startBusiness() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        work()
        
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let completedJobCount = loanSection.completedJobCount + depositSection.completedJobCount
        
        endBusiness(count: completedJobCount, time: durationTime)
    }
    
    private func endBusiness(count completedJobCount: Int, time durationTime: CFAbsoluteTime) {
        let formattedTime = String(format: "%.2f", durationTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(completedJobCount)명이며, 총 업무시간은 \(formattedTime)초입니다.\n")
    }
}
