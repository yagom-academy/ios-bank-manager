//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

struct Bank {
    var customer: [Customer]
    var bankManager: [BankManager]
    var numberOfCustomer: Int {
        return customer.count
    }
    var totalTime: Double {
        var sum: Double = 0
        customer.forEach { customer in
            sum += customer.timeNeedToFinishTask
        }
        return sum
    }
    
    func printFinishBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}

