//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankPrinter { }

extension BankPrinter: BankDelegate {
    func printClosingMessage(customers: Int, processingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(processingTime.formatted)초입니다.")
    }
}

extension BankPrinter: BankClerkDelegate {
    func printBeginWorkMessage(of customer: Customer) {
        print("\(customer.turn)번 고객 업무 시작")
    }
    
    func printFinishWorkMessage(of customer: Customer) {
        print("\(customer.turn)번 고객 업무 완료")
    }
}

private extension Double {
    var formatted : String {
        return String(format: "%.2f", self)
    }
}
