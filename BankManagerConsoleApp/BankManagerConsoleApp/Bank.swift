//
//  Bank.swift
//  Created by sunnycookie, inho
//

import Foundation

struct Bank {
    var customers: Queue<Customer>
    var completedCustomerCount: Int = 0
    var processingTime: Double {
        guard let result = Double(String(format: "%.2f",
                                         0.7 * Double(completedCustomerCount)))
        else {
            return 0.0
        }
        
        return result
    }

    mutating func startBanking() {
        while !customers.isEmpty {
            guard let customer = customers.dequeue() else {
                return
            }
            
            serveCustomer(number: customer.waitingNumber)
        }
        
        closeBanking()
    }
    
    mutating func serveCustomer(number: Int) {
        print("\(number)번 고객 업무 시작")
        sleep(1)
        completedCustomerCount += 1
        print("\(number)번 고객 업무 완료")
    }
    
    func closeBanking() {
        print("업무가 마감되었습니다. " +
              "오늘 업무를 처리한 고객은 총 \(completedCustomerCount)명이며, " +
              "총 업무시간은 \(processingTime)초입니다.")
    }
}
