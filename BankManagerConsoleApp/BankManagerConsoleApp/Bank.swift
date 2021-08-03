//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    var clerkNumber: Int = 1
}

extension Bank {
    mutating func makeWaitingLine(from totalCustomerNumber: Int) -> Queue<Int> {
        var waitingLine = Queue<Int>()
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(i)
        }
        return waitingLine
    }
    
    mutating func notifyClosing(totalCustomer: Int, totalTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
