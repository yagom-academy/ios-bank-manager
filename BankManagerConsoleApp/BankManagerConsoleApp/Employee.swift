//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

struct Employee {
    var bank: WaitingLineManageable?
    private let seconds = 0.7
    private var customerCount = 0
    
    func startJob() {
        guard let customer = bank?.waitingLine.first else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 업무 시작")
    }
    
    mutating func finishJob() {
        guard let customer = bank?.waitingLine.dequeue() else {
            return
        }
        
        Thread.sleep(forTimeInterval: seconds)
        customerCount += 1
        
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
    
    func calculate(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) {
        let duration = closeTime - openTime
        
        guard let workTime = duration.toDecimal else {
            return
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(workTime)초입니다.")
    }
}

// MARK : - CFAbsoluteTime Extension

extension CFAbsoluteTime {
    var toDecimal: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(for: self)
    }
}
