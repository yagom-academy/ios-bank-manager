//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    func selectMenu() {
        while true {
            print("1 : 은행 개점/n2 : 종료/n입력 : ", terminator: "")
            
            guard let userInput = readLine() else { return }
            
            switch userInput {
            case "1":
                openBank()
            case "2":
                return
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    private func openBank() {
        var bank = Bank(bankClerk: BankClerk(), customerWaitingQueue: occurrenceCustomer())
        bank.work()
    }
    
    private func occurrenceCustomer() -> CustomerWaitingQueue<Customer> {
        var customerWaitingQueue: CustomerWaitingQueue<Customer> = CustomerWaitingQueue()
        
        for number in 1...Int.random(in: 10...30) {
            customerWaitingQueue.enqueue(Customer(number: number))
        }
        
        return customerWaitingQueue
    }
}
