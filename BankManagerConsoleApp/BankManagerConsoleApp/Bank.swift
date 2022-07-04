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
    
    mutating func selectBankOpenAndClose() {
        printBankInterface()
        let requestInput = userInput()
        var clerk = BankManager()
        let rangeCustomerCount: ClosedRange<Int> = 10...30
        switch requestInput {
        case BankComent.bankOpen.rawValue:
            let customerCount = Int.random(in: rangeCustomerCount)
            clerk.handleBanking(customerList: makeCustomerWaitingList(by: customerCount))
            reportWorkResult(resultCustomer: customerCount, processTime: BusinessType.work.rawValue)
            bankBusinessStart()
        case BankComent.bankClose.rawValue:
            break
        default:
            bankBusinessStart()
        }
    }
    
    private func printBankInterface() {
        print(BankComent.greeting.rawValue)
        print(BankComent.secondGreeting.rawValue, terminator: BankComent.emptyValue.rawValue)
    }
    
    private func printReportWorkResult(handledCustomer: Int, handledWorkTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(handledCustomer)명 이며, 총 업무시간은 \(handledWorkTime)초 입니다.")
    }
    
    mutating func makeCustomerWaitingList(by totalCustomer: Int) -> BankItemQueue<Customer> {
        var watingQueue = BankItemQueue<Customer>()
        
        for ticketNumber in SetNumber.minimumCustomerCount.rawValue...totalCustomer {
            let customer = Customer(bankNumberTicket: ticketNumber)
            watingQueue.enQueue(customer)
        }
        return watingQueue
    }
    
    private func reportWorkResult(resultCustomer: Int, processTime: Double) {
        let calculateWorkTime = Double(resultCustomer) * processTime
        let totalWorkTime = numberFormatter(number: calculateWorkTime)
        printReportWorkResult(handledCustomer: resultCustomer, handledWorkTime: totalWorkTime)
    }
}
