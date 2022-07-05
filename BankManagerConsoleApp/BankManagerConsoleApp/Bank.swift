//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

struct Bank {
    var customer: BankItemQueue<Customer>
    let bankmanager: BankManager
    
    init(customer: BankItemQueue<Customer>, bankmanager: BankManager) {
        self.customer = customer
        self.bankmanager = bankmanager
    }
    
    mutating func bankBusinessStart() {
        selectBankOpenAndClose()
    }
    
    mutating func selectBankOpenAndClose() {
        printBankInterface()
        let requestInput = userInput()
        let numberOfCustomer = customer.count
        switch requestInput {
        case BankComment.bankOpen.rawValue:
            giveTask(for: customer)
            calculateWorkTime(by: numberOfCustomer)
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
    
    private func calculateWorkTime(by resultCustomer: Int) {
        do {
            let calculatedWorkTime = Double(resultCustomer) * BusinessType.deposit.type
            let totalWorkTime = try calculatedWorkTime.numberFormatter()
            printcalculateWorkTime(by: resultCustomer, with: totalWorkTime)
        } catch {
            printFailChange()
        }
    }
    
    mutating func giveTask(for customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        
        while let completeCustomer = customerList.deQueue() {
            bankmanager.handleBanking(for: completeCustomer)
        }
    }
}
