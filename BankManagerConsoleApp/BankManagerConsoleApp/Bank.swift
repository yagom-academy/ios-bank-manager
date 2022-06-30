//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

struct Bank {
    
    mutating func bankBusinessStart() {
        selectBankOpenAndClose()
    }
    
    func printBankInterface() {
        print("1 : 은행개점 \n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    
    mutating func makeCustomerWaitingList(by totalCustomer: Int) -> BankItemQueue<Customer> {
        var watingQueue = BankItemQueue<Customer>()
        
        for ticketNumber in 1...totalCustomer {
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
            let customerCount = Int.random(in: 10...30)
            clerk.handleBanking(customerList: makeCustomerWaitingList(by: customerCount))
            reportWorkResult(resultCustomer: customerCount, processTime: 0.7)
            bankBusinessStart()
        case "2":
            break
        default:
            bankBusinessStart()
        }
    }
}
