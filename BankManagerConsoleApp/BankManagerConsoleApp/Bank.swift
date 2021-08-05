//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/30.
//

import Foundation

class Bank {
    private let bankManagers: [BankManager]
    private let waitList = Queue<Customer>()
    private var countOfCustomer: Int = 0
    private let minCustomerNumber = 10
    private let maxCustomerNumber = 30
    private let numberFormatter = NumberFormatter()

    init(bankManagers: [BankManager]) {
        self.bankManagers = bankManagers
    }
    
    private func makeRandomCustomerNumber() {
        countOfCustomer = Int.random(in: minCustomerNumber...maxCustomerNumber)
    }

    private func addCustomer() {
        (1...countOfCustomer).forEach { order in
            let customer = Customer(order)
            waitList.enqueue(customer)
        }
    }
    
    private func assignTask(to bankManager: BankManager) {
        while waitList.isEmpty() == false {
            guard let customer = waitList.dequeue() else {
                return
            }
            bankManager.startWork(customer)
        }
    }
    
    private func checkTotalTime(of process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
    
    private func printWorkDone(_ time: Double) {
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
            assignTask(to: bankManagers[0])
        }
        printWorkDone(totalWorkTime)
    }
}
