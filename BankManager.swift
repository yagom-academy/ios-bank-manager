//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    func selectMenu() {
        var isSelectMenuOn = true
        
        while isSelectMenuOn {
            print(BankManager.NameSpace.menuGuide, terminator: "")
            
            guard let userInput = readLine() else { return }
            
            switch userInput {
            case BankManager.NameSpace.selectOpenBank:
                openBank()
            case BankManager.NameSpace.selectExit:
                isSelectMenuOn = false
            default:
                print(BankManager.NameSpace.wrongInput)
            }
        }
    }
    
    private func openBank() {
        var bank = Bank(depositBankClerkCount: 2, loanBankClerkCount: 1, customerWaitingQueue: occurrenceCustomer())
        bank.work()
    }
    
    private func occurrenceCustomer() -> CustomerWaitingQueue<Customer> {
        var customerWaitingQueue: CustomerWaitingQueue<Customer> = CustomerWaitingQueue()
        
        for number in 1...Int.random(in: 10...30) {
            guard let workType = ServiceType.allCases.randomElement() else { continue }
            let customer = Customer(number: number, serviceNeeded: workType)
            customerWaitingQueue.enqueue(customer)
        }
        
        return customerWaitingQueue
    }
}

extension BankManager {
    private enum NameSpace {
        static let menuGuide: String = "1 : 은행 개점\n2 : 종료\n입력 : "
        static let wrongInput: String = "잘못된 입력입니다."
        static let selectOpenBank: String = "1"
        static let selectExit: String = "2"
    }
}
