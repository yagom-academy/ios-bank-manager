//
//  BankClerk.swift
//
//
//  Created by Kiseok on 11/16/23.
//

import Foundation

@available(macOS 10.15, *)
struct BankClerk {
    
    func startTask(with customer: Customer) async {
        print("\(customer.waitingTicket)번 고객 \(customer.bankingCategory.description)업무 시작")
        do {
            try await Task.sleep(nanoseconds: customer.bankingCategory.rawValue)
        } catch {
            print(error.localizedDescription)
        }
        print("\(customer.waitingTicket)번 고객 \(customer.bankingCategory.description)업무 종료")
    }
    
    func endTask(customerNumber: Int, time: CFAbsoluteTime) {
        print("업무가 마감 되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(String(format: "%.2f", time))초입니다.")
    }
}
