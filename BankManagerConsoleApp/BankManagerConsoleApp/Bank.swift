//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    let customer: Customer
    let customerQueue = BankManagerQueue<Int>()
    let banker: Banker
    
    func startTask() {
        selectMode()
        if userInput() {
            initCustomerQueue()
            while !customerQueue.isEmpty {
                banker.doBusiness()
            }
            print(BankMessage.bankClosed(customers: customer.numbers))
        }
    }
    
    func initCustomerQueue() {
        for customer in Int.one...customer.numbers {
            customerQueue.enqueue(data: customer)
        }
    }
    
    func selectMode() {
        print(BankMessage.openBank)
        print(BankMessage.closedBank)
    }
    
    func userInput() -> Bool {
        if let input = readLine(), let intInput = Int(input), intInput == Int.one {
            return true
        }
        print("잘못된 입력입니다.")
        return false
    }
}
