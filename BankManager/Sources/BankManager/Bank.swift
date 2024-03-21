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
    
    private func enqueueTodaysVisitors() {
        (1...Int.random(in: 10...30)).forEach {
            let customer = Customer(waitingNumber: $0)
            bankQueue.enqueue(element: customer)
        }
    }
    
    func commenceBanking() {
        enqueueTodaysVisitors()
        let visitedCustomerNumber = bankQueue.count
        
        let concurrentLimitingSemaphore = DispatchSemaphore(value: numberOfBankClerk)
        
        let startBankingTime = DispatchTime.now()
        while !bankQueue.isEmpty {
            concurrentLimitingSemaphore.wait()
            
            guard let customer = bankQueue.dequeue() else { return }
            
            DispatchQueue.global().async {
                print("\(customer.waitingNumber)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("\(customer.waitingNumber)번 고객 업무 완료")
                concurrentLimitingSemaphore.signal()
            }
        }
        let endBankingTime = DispatchTime.now()
        let elapseBankingTimeNanoseconds = endBankingTime.uptimeNanoseconds - startBankingTime.uptimeNanoseconds
        let elapseBankingTime = (Double(elapseBankingTimeNanoseconds) / 1_000_000_000).rounded(toPlaces: 2)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(visitedCustomerNumber)명이며, 총 업무시간은 \(elapseBankingTime)초입니다.")
    }
}

extension Double {
    func rounded(toPlaces: Int) -> Double {
        let divisor = pow(10.0, Double(toPlaces))
        return (self * divisor).rounded() / divisor
    }
}
