//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var numberOfCustomers: Int = 0
    private var lineOfCustomers = BankManagerQueue<Customer>()
    
    private func generateRandomNumberOfCustomers() {
        numberOfCustomers = Int.random(in: 10...30)
    }
    
    private func insertCustomersIntoQueue() {
        for element in 1...numberOfCustomers {
            let customer = Customer(customerNumber: element)
            lineOfCustomers.enqueue(data: customer)
        }
    }
    
    private func handleCustomers() {
        DispatchQueue.global().sync {
            var totalTimeOfWork: Double = 0.0
            while !self.lineOfCustomers.isEmpty {
                guard let customer = self.lineOfCustomers.dequeue() else { return }
                print("\(customer.customerNumber)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: ProcessingTime.general.workTime)
                print("\(customer.customerNumber)번 고객 업무 완료")
                totalTimeOfWork += ProcessingTime.general.workTime
            }
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeOfWork))초 입니다.")
        }
    }
    
    func openBank() {
        DispatchQueue.global().sync {
            var userInput: String?
            repeat {
                Bank.inputMenu()
                userInput = readLine()
                if let input = userInput {
                    if input == "1" {
                        self.generateRandomNumberOfCustomers()
                        self.insertCustomersIntoQueue()
                        self.handleCustomers()
                    }
                }
            } while userInput != "2"
        }
    }
}

