//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

import Foundation

struct Banker: Workable {
    var totalWorkTime: Double

    init() {
        self.totalWorkTime = 0.0
    }
    
    mutating func startWork(of customer: BankCustomer) {
        printStartWork(of: customer)
        usleep(700000)
        self.totalWorkTime += 0.7
    }
    
    mutating func finishWork(of customer: BankCustomer) {
        printFinishWork(of: customer)
    }
    
    private func printStartWork(of customer: BankCustomer) {
        print("\(customer.id)번 고객 업무 시작")
    }
    
    private func printFinishWork(of customer: BankCustomer) {
        print("\(customer.id)번 고객 업무 완료")
    }
}
