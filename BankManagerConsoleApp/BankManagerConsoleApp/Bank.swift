//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Sol on 2021/07/30.
//

import Foundation

struct Bank {
    let bankManager: BankManager
    let waitList = Queue<Int>()
    var customerNumber: Int
    let minCustomerNumber = 10
    let maxCustomerNumber = 30
    let totalWorkTime: Double

    mutating func openBank() {
        makeRandomCustomerNumber()
    }
   
    mutating func makeRandomCustomerNumber() {
        customerNumber = Int.random(in: minCustomerNumber...maxCustomerNumber)
    }
    
    func finishWork() {
        print("업무가 마갑되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
