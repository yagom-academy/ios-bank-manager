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
        let numberOfCustomer = setCustomerCount()
        switch requestInput {
        case BankComment.bankOpen.rawValue:
            giveTask(customerList: makeCustomerWaitingList(by: numberOfCustomer))
            calculateWorkTime(by: numberOfCustomer, with: BusinessType.work.rawValue)
            bankBusinessStart()
        case BankComment.bankClose.rawValue:
            break
        default:
            printWrongInput()
            bankBusinessStart()
        }
    }
    
    private func printBankInterface() {
        print(BankComment.greeting.rawValue)
        print(BankComment.secondGreeting.rawValue, terminator: BankComment.emptyValue.rawValue)
    }
    
    private func printcalculateWorkTime(by handledCustomer: Int, with handledWorkTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(handledCustomer)명 이며, 총 업무시간은 \(handledWorkTime)초 입니다.")
    }
    
    private func printWrongInput() {
        print(BankComment.wrongInputGreeting.rawValue)
    }
    
    private func printFailChange() {
        print(BankComment.failChange.rawValue)
    }
    
    mutating func makeCustomerWaitingList(by totalCustomer: Int) -> BankItemQueue<Customer> {
        var watingQueue = BankItemQueue<Customer>()
        
        for ticketNumber in SetNumber.minimumCustomerCount.rawValue...totalCustomer {
            let ticketHolder = takeNumberTicket(number: ticketNumber)
            watingQueue.enQueue(ticketHolder)
        }
        return watingQueue
    }
    
    private func calculateWorkTime(by resultCustomer: Int, with processTime: Double) {
        do {
            let calculatedWorkTime = Double(resultCustomer) * processTime
            let totalWorkTime = try calculatedWorkTime.numberFormatter()
            printcalculateWorkTime(by: resultCustomer, with: totalWorkTime)
        } catch {
            printFailChange()
        }
    }
    
    mutating func giveTask(customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        let processingTime = WorkType()
        
        while let completeCustomer = customerList.deQueue() {
            BankManager().handleBanking(customer: completeCustomer, processingTime: processingTime)
        }
    }
}
