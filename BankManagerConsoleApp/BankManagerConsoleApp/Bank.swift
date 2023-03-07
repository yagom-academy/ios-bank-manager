//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//
import Foundation

struct Bank {
    private let bankers: [Banker]
    private var customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    
    init(bankersCount: Int) {
        self.bankers = .init(repeating: Banker(), count: bankersCount)
        
        let numberOfCustomer = Int.random(in: 10...10)
        
        for waitingNumber in 1...numberOfCustomer {
            let customer = Customer(waitingNumber: waitingNumber)
            customerQueue.enqueue(customer)
        }
    }
    
    func open() {
        var completedJobCount = 0
        let startTime = CFAbsoluteTimeGetCurrent()
        while customerQueue.isEmpty == false {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            bankers[0].work(customer: currentCustomer)
            completedJobCount += 1
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        close(completedJobCount, durationTime)
    }
    
    private func close(_ completedJobCount: Int, _ durationTime: CFAbsoluteTime) {
        let formattedTime = String(format: "%.2f", durationTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(completedJobCount)명이며, 총 업무시간은 \(formattedTime)초입니다.\n")
    }
}
