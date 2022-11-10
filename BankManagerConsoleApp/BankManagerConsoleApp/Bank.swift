//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/03.
//

import Foundation

struct Bank {
    private var customerQueue: Queue<Customer> = Queue()
    private var depositBankerQueue: Queue<Banker> = Queue()
    private var loanBankerQueue: Queue<Banker> = Queue()
    private var totalCustomerCount: Int = 0
    private var totalTime: Double = 0
    
    mutating func addCustomerToQueue(_ customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    mutating func addBanker(_ bankers: [Banker]) {
        for banker in bankers {
            switch banker.bankBusiness {
            case .deposit:
                depositBankerQueue.enqueue(banker)
            case .loan:
                loanBankerQueue.enqueue(banker)
            }
        }
    }
    
    mutating func startBankBusiness() {
        let depositSemaphore: DispatchSemaphore = DispatchSemaphore(value: depositBankerQueue.count)
        let loanSemaphore: DispatchSemaphore = DispatchSemaphore(value: loanBankerQueue.count)
        let group: DispatchGroup = DispatchGroup()
        
        while customerQueue.isEmpty != true {
            guard let customer: Customer = customerQueue.dequeue() else { return }
            switch customer.bankBusiness {
            case .deposit:
                guard let banker: Banker = self.depositBankerQueue.dequeue() else { return }
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    banker.processBankingBusiness(of: customer)
                    depositSemaphore.signal()
                }
                self.totalCustomerCount += 1
                self.depositBankerQueue.enqueue(banker)
            case .loan:
                guard let banker: Banker = self.loanBankerQueue.dequeue() else { return }
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    banker.processBankingBusiness(of: customer)
                    loanSemaphore.signal()
                }
                self.totalCustomerCount += 1
                self.loanBankerQueue.enqueue(banker)
            }
        }
        group.wait()
        printClosingMessage()
    }
    
    private mutating func printClosingMessage() {
        let formattedProcessedTotalTime: String = String(format: "%.2f", totalTime)
        let processingClosedMessage: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(formattedProcessedTotalTime)초입니다."
        print(processingClosedMessage)
    }
}
