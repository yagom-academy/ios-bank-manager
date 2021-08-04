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
    var countOfCustomer: Int = 0
    let minCustomerNumber = 10
    let maxCustomerNumber = 30
    let numberFormatter = NumberFormatter()
    
    init(bankManager: [BankManager]) {
        self.bankManager = bankManager
    }
    
    func makeRandomCustomerNumber() {
        countOfCustomer = Int.random(in: minCustomerNumber...maxCustomerNumber)
    }
    
    func addCustomer() {
        (1...countOfCustomer).forEach { index in
            waitList.enqueue(index)
        }
    }
    
    func assignTask(to bankManager: BankManager) {
        while waitList.isEmpty() == false {
            guard let customer = waitList.dequeue() else {
                return
            }
            bankManager.startWork(customer)
        }
    }
    
    func checkTotalTime(of process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
    
    func printWorkDone(_ time: Double) {
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumSignificantDigits = 2
        
        if let formattedTime = numberFormatter.string(for: time) {
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(countOfCustomer)이며, 총 업무시간은 \(formattedTime)초입니다.")
        }
    }
    
    func openBank() {
        let totalWorkTime = checkTotalTime {
            makeRandomCustomerNumber()
            addCustomer()
            assignTask(to: bankManager[0])
        }
        printWorkDone(totalWorkTime)
    }
}
