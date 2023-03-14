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
    
    func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            guard let customer = BankingType.init(countNumber: i) else { return }
            self.customerCountQueue.enqueue(data: customer)
        }
    }

    func manageBanking() {
        guard let currentCustomer = customerCountQueue.dequeue() else { return }
        let semaphore = DispatchSemaphore(value: currentCustomer.customer.deskCount)
        let group = DispatchGroup()
        let dispatchQueue = DispatchQueue(label: currentCustomer.customer.rawValue)
        
        while customerCountQueue.isEmpty() == false {
        
            switch currentCustomer.customer {
            case .deposit:
                dispatchQueue.async(group: group) {
                    semaphore.wait()
                    guard let currentCustomer = self.customerCountQueue.peek() else { return }
                    print("\(currentCustomer)번 고객 예금업무 시작")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    print("\(currentCustomer)번 고객 예금업무 종료")
                    self.customerCountQueue.dequeue()
                    semaphore.signal()
                }
            case .loan:
                dispatchQueue.async(group: group) {
                    semaphore.wait()
                    guard let currentCustomer = self.customerCountQueue.peek() else { return }
                    print("\(currentCustomer)번 고객 대출업무 시작")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    print("\(currentCustomer)번 고객 대출업무 종료")
                    self.customerCountQueue.dequeue()
                    semaphore.signal()
                }
            }
        }
        closeBanking()
    }

//    func assignBankingDesk(customer: Customer){
//         guard let currentCustomer = self.customerCountQueue.peek() else { return }
//         print("\(currentCustomer)번 고객 대출업무 시작")
//         Thread.sleep(forTimeInterval: customer.takenTimeForBanking)
//         print("\(currentCustomer)번 고객 대출업무 종료")
//         self.customerCountQueue.dequeue()
//     }
    
    private func closeBanking() {
        let time: Double = 0.7 * Double(customerCount)
        let formattedTime = time.digitFormatter()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(formattedTime)초입니다 ")
    }
}


