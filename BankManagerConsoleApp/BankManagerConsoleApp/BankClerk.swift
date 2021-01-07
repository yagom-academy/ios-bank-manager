//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by sole on 2021/01/08.
//

import Foundation

class BankClerk {
    let bankWindowNumber: Int
    var customers: [Custmer] = []
    var finishedCustomerNumber: Int = 0
    var totalTaskTime: Double = 0.0
    var working: Bool = false {
        didSet {
            if working == false {
                guard let custmer = bankManager.waitingList.first else {
                    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(finishedCustomerNumber)명이며, 총 업무시간은 \(round(100 * totalTaskTime) / 100)초입니다.")
                    bank.message()
                    return
                }
                customers.append(custmer)
                startWork()
                finishWork()
            }
        }
    }
    
    func startWork() {
        guard let customer = customers.first else {
            return
        }
        bankManager.waitingList.removeFirst()
        working = true
        print("\(customer.index)번 손님 업무 시작")
    }
    
    func finishWork() {
        guard let customer = customers.first else {
            return
        }
        finishedCustomerNumber += 1
        totalTaskTime += customer.taskTime
        customers.removeFirst()
        print("\(customer.index)번 손님 업무 완료")
        working = false
    }
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
    }
}
