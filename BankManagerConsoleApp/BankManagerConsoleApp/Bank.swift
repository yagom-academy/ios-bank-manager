//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

struct Bank {
    
    mutating func bankStart() {
        selectBankOpenAndClose()
    }
    
    func printBankInterface() {
        print("1 : 은행개점 \n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func makeCustomerWaitingList() -> BankItemQueue<Customer> {
        let customerCount = 1...Int.random(in: 10...30)
        var watingQueue = BankItemQueue<Customer>()
        
        for ticketNumber in customerCount {
            let customer = Customer(bankNumberTicket: ticketNumber)
            watingQueue.enQueue(customer)
        }
        return watingQueue
    }
    
    mutating func selectBankOpenAndClose() {
        printBankInterface()
        let requestInput = readLine()?.trimmingCharacters(in: .whitespaces) ?? "2"
        var clerk = BankClerk()
        
        switch requestInput {
        case "1":
            clerk.handleBanking(customerList: makeCustomerWaitingList())
            bankStart()
        case "2":
            break
        default:
            bankStart()
        }
    }
}
