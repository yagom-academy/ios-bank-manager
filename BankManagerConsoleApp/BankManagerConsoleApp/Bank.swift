//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/04/27.
//

import Foundation

struct Bank {
    private var teller: Teller?
    private var remainingCustomer: Int = 0
    private var totalCustomer: Int = 0
    
    init() {
        self.remainingCustomer = Int.random(in: 10...30)
        self.totalCustomer = remainingCustomer
    }
    
    private func open() {
        // 텔러 업무 처리
    }
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)이며, 총 업무 시간은 \(totalProcessedTime())초입니다.")
    }
    mutating private func visitNewCustomer() {
        totalCustomer += 1
        remainingCustomer += 1
    }
    private func checkIfNoCustomer() {
        if remainingCustomer == 0 {
            self.close()
        }
    }
    private func totalProcessedTime() -> Double {
        let processingTimePerTask: Double = 0.7
        return processingTimePerTask * Double(totalCustomer)
    }
}
