//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    private var bankClerk = BankClerk()
    private var waitingLine = Queue<Int>()
}

extension Bank {
    mutating func makeWaitingLine(from totalCustomerNumber: Int) {
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(i)
        }
    }
    
    mutating func letClerkWork() {
        while waitingLine.isEmpty() == false {
            let currentCustomer = waitingLine.peek()
            waitingLine.dequeue()
            bankClerk.work(for: currentCustomer)
        }
    }
    
    mutating func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
