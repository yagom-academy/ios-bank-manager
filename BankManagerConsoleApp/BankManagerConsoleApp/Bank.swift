//
//  Bank.swift
//  Created by sunnycookie, inho
//

import Foundation

struct Bank {
    var customers: Queue<Customer>
    var completedCustomerCount: Int = 0
    var totalProcessingTime: String {
        let result = String(format: Constant.twoDecimal,
                            Constant.processingTime * Double(completedCustomerCount))
        return result
    }

    mutating func startBanking() {
        while !customers.isEmpty {
            guard let customer = customers.dequeue() else {
                return
            }
            
            serveCustomer(number: customer.waitingNumber)
        }
    }
    
    mutating func serveCustomer(number: Int) {
        print(Constant.startMessage(number))
        Thread.sleep(forTimeInterval: Constant.processingTime)
        completedCustomerCount += 1
        print(Constant.endMessage(number))
    }
    
    func closeBanking() {
        print(Constant.bankClosedMessage(completedCustomerCount, totalProcessingTime))
    }
}

extension Bank {
    enum Constant {
        static let twoDecimal: String = "%.2f"
        static let processingTime: Double = 0.7
        static let startMessage = { ( number: Int ) -> String in
            return "\(number)번 고객 업무 시작"
        }
        static let endMessage = { ( number: Int ) -> String in
            return "\(number)번 고객 업무 종료"
        }
        static let bankClosedMessage = { (customerCount: Int, processingTime: String) -> String in
            return "업무가 마감되었습니다. " +
                   "오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(processingTime)초입니다."
        }
        
    }
}
