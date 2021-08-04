//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/30.
//

import Foundation

class Bank {
    let bankManager: [BankManager]
    let waitList = Queue<Int>()
    var customerNumber: Int = 0
    let minCustomerNumber = 10
    let maxCustomerNumber = 30
    let numberFormatter = NumberFormatter()
    
    init(bankManager: [BankManager]) {
        self.bankManager = bankManager
    }
    
    func makeRandomCustomerNumber() {
        customerNumber = Int.random(in: minCustomerNumber...maxCustomerNumber)
    }
    
    func checkTotalTime(of process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
    
    func openBank() {
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumSignificantDigits = 2
       
        let totalWorkTime = checkTotalTime {
            makeRandomCustomerNumber()
            bankManager[0].startWork(customerNumber)
        }
        
        if let formattedTime = numberFormatter.string(for: totalWorkTime) {
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)이며, 총 업무시간은 \(formattedTime)초입니다.")
        }
    }
}
