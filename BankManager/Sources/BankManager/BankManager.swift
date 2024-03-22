//
//  BankManager.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

import Foundation

public struct BankManager {
    private let numberOfBankClerk: Int
    private let bankQueue = BankQueue<Customer>()
    
    public init(numberOfBankClerk: Int) {
        self.numberOfBankClerk = numberOfBankClerk
    }
    
    private func enqueueTodaysVisitors() {
        (1...Int.random(in: 10...30)).forEach {
            let customer = Customer(waitingNumber: $0)
            bankQueue.enqueue(element: customer)
        }
    }
    
    public func commenceBanking() {
        enqueueTodaysVisitors()
        let visitedCustomerNumber = bankQueue.count
        
        let concurrentLimitingSemaphore = DispatchSemaphore(value: numberOfBankClerk)
        let bankingGroup = DispatchGroup()
        
        let startBankingTime = DispatchTime.now()
        while !bankQueue.isEmpty {
            concurrentLimitingSemaphore.wait()
            
            guard let customer = bankQueue.dequeue() else { return }
            
            DispatchQueue.global().async(group: bankingGroup) {
                print("\(customer.waitingNumber)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("\(customer.waitingNumber)번 고객 업무 완료")
                concurrentLimitingSemaphore.signal()
            }
        }
        
        bankingGroup.wait()
        
        let endBankingTime = DispatchTime.now()
        let elapseBankingTimeNanoseconds = endBankingTime.uptimeNanoseconds - startBankingTime.uptimeNanoseconds
        let elapseBankingTime = (Double(elapseBankingTimeNanoseconds) / 1_000_000_000).rounded(toPlaces: 2)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(visitedCustomerNumber)명이며, 총 업무시간은 \(elapseBankingTime)초입니다.")
    }
}
