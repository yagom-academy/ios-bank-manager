//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct Bank {
    
    private var bankManager: BankManager
    
    init() {
        bankManager = BankManager(numberOfBanker: 3)
    }
    
    private func startWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankManager.inputCustomersToWaitingLine()
        let endTime = CFAbsoluteTimeGetCurrent()
        BankPrinter.printFinishPharse(totalCustomerNumber: bankManager.numberOfCustomer, totalSecond: endTime - startTime)
    }
    
    func open() {
        while (true) {
            BankPrinter.printMenu()
            let input = InputHelper.receive()
            switch input {
            case "1":
                startWork()
            case "2":
                return
            default:
                BankPrinter.printWrongInputPharse()
            }
        }
    }
    
}
