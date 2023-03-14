//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Andrew.goat on 2023/03/07.
//

import Foundation

class BankManager {
    private var customerCountQueue: BankQueue<Int> = BankQueue<Int>()
    var customerCount: Int = 0
    let semaphore = DispatchSemaphore(value: 2)
    
    func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            self.customerCountQueue.enqueue(data: i)
        }
    }
    
    func manageBanking() {
        while customerCountQueue.isEmpty() == false {
            let group = DispatchGroup()
            
            let depositBankClerk1 = DispatchQueue(label: "depositBankClerk1")
            let depositBankClerk2 = DispatchQueue(label: "depositBankClerk2")
            let loanBankClerk = DispatchQueue(label: "loanBankClerk")
            
            depositBankClerk1.async(group: group) {
                self.semaphore.wait()
                guard let currentCustomer = self.customerCountQueue.peek() else { return }
                print("\(currentCustomer)번 고객 예금업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("\(currentCustomer)번 고객 예금업무 종료")
                self.customerCountQueue.dequeue()
                self.semaphore.signal()
            }
            
            depositBankClerk2.async(group: group) {
                self.semaphore.wait()
                guard let currentCustomer = self.customerCountQueue.peek() else { return }
                print("\(currentCustomer)번 고객 예금업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("\(currentCustomer)번 고객 예금업무 종료")
                self.customerCountQueue.dequeue()
                self.semaphore.signal()
            }
            
            loanBankClerk.async(group: group) {
                self.semaphore.wait()
                guard let currentCustomer = self.customerCountQueue.peek() else { return }
                print("\(currentCustomer)번 고객 대출업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("\(currentCustomer)번 고객 대출업무 종료")
                self.customerCountQueue.dequeue()
                self.semaphore.signal()
            }
        }
        closeBanking()
    }
    
    private func closeBanking() {
        let time: Double = 0.7 * Double(customerCount)
        let formattedTime = time.digitFormatter()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(formattedTime)초입니다 ")
    }
}
