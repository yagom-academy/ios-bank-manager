//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Andrew.goat on 2023/03/07.
//

import Foundation

class BankManager {
    private var customerCountQueue: BankQueue<BankingType> = BankQueue<BankingType>()
    var customerCount: Int = 0
    
    func banking(){
        insertCustomerCountToQueue()
        closeBanking()
    }
    
    private func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            guard let customer = BankingType.init(countNumber: i) else { return }
            self.customerCountQueue.enqueue(data: customer)
        }
    }

    private func manageBanking() {
        let group = DispatchGroup()
        let depositDispatchQueuqe = DispatchQueue(label: "depositDispatchQueuqe")
        let loanDispatchQueue = DispatchQueue(label: "loanDispatchQueue")
        
        while customerCountQueue.isEmpty() == false {
            guard let dequeueCustomer = customerCountQueue.peek() else { return }
            let semaphore = DispatchSemaphore(value: dequeueCustomer.customer.deskCount)
            
            switch dequeueCustomer.customer {
            case .deposit:
                depositDispatchQueuqe.async(group: group) {
                    semaphore.wait()
                    print("\(dequeueCustomer.countNumber)번 고객 예금업무 시작")
                    Thread.sleep(forTimeInterval: dequeueCustomer.customer.takenTimeForBanking)
                    print("\(dequeueCustomer.countNumber)번 고객 예금업무 종료")
                    semaphore.signal()
                }
            case .loan:
                loanDispatchQueue.async(group: group) {
                    semaphore.wait()
                    print("\(dequeueCustomer.countNumber)번 고객 대출업무 시작")
                    Thread.sleep(forTimeInterval: dequeueCustomer.customer.takenTimeForBanking)
                    print("\(dequeueCustomer.countNumber)번 고객 대출업무 종료")
                    semaphore.signal()
                }
            }
            self.customerCountQueue.dequeue()
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
        let bankingTime = calculateProcessTime(manageBanking)
        let formattedBankingTime = bankingTime.digitFormatter()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(formattedBankingTime)초입니다 ")
    }
}


