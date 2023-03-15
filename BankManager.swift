//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Andrew.goat on 2023/03/07.
//

import Foundation

class BankManager {
    private var customerQueue: BankQueue<BankingType> = BankQueue<BankingType>()
    var customerCount: Int = 0
    private var semaphoreValue: Int = 0
    private lazy var semaphore = DispatchSemaphore(value: semaphoreValue)

   func manageBanking(){
        insertCustomerCountToQueue()
        closeBanking()
    }
    
    private func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            guard let count = BankingType.init(customerNumber: i) else { return }
            self.customerQueue.enqueue(data: count)
        }
    }

    private func banking() {
        let group = DispatchGroup()
        let depositDispatchQueuqe = DispatchQueue(label: "depositDispatchQueuqe")
        let loanDispatchQueue = DispatchQueue(label: "loanDispatchQueue")
        
        
        while customerQueue.isEmpty() == false {
            guard let currentCustomer = customerQueue.peek() else { return }
            semaphoreValue = currentCustomer.customer.deskCount
            switch currentCustomer.customer {
            case .deposit:
                depositDispatchQueuqe.async(group: group) {
                    self.semaphore.wait()
                    print("\(currentCustomer.customerNumber)\(BankingMessage.depositStartMessage)")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    print("\(currentCustomer.customerNumber)\(BankingMessage.depositEndingMessage)")
                    self.semaphore.signal()
                }
            case .loan:
                loanDispatchQueue.async(group: group) {
                    self.semaphore.wait()
                    print("\(currentCustomer.customerNumber)\(BankingMessage.loanStartMessage)")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    print("\(currentCustomer.customerNumber)\(BankingMessage.loanEndingMessage)")
                    self.semaphore.signal()
                }
            }
            self.customerQueue.dequeue()
        }
        group.wait()
    }
    
    private func calculateProcessTime(_ process: () -> () ) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }

    private func closeBanking() {
        let bankingTime = calculateProcessTime(banking)
        let formattedBankingTime = bankingTime.digitFormatter()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(formattedBankingTime)초입니다 ")
    }
}


