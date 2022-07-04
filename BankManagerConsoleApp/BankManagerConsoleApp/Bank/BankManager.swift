//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var bank: Bank
    private var specialized: WorkType
    
    init(bank: Bank, specialized: WorkType) {
        self.bank = bank
        self.specialized = specialized
    }
    
    private func handleCustomers() {
        DispatchQueue.global().sync {
            var totalTimeOfWork: Double = 0.0
            while !bank.lineOfCustomers.isEmpty {
                guard let customer = bank.lineOfCustomers.dequeue() else { return }
                print("\(customer.customerNumber)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: WorkType.deposit.processingTime)
                print("\(customer.customerNumber)번 고객 업무 완료")
                totalTimeOfWork += WorkType.deposit.processingTime
            }
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.numberOfCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeOfWork))초 입니다.")
        }
    }
    
    func openBank() {
        DispatchQueue.global().sync {
            var userInput: String?
            repeat {
                bank.inputMenu()
                userInput = readLine()
                if let input = userInput {
                    if input == "1" {
                        bank.generateRandomNumberOfCustomers()
                        bank.insertCustomersIntoQueue()
                        self.handleCustomers()
                    }
                }
            } while userInput != "2"
        }
    }
}

