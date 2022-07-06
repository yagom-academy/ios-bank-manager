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
            let totalTaskTime = giveTask(for: customer)
            calculateWorkTime(by: numberOfCustomer, with: totalTaskTime)
            initiateBankBusiness()
        case BankComment.bankClose.rawValue:
            break
        default:
            printWrongInput()
            initiateBankBusiness()
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
    
    private func calculateWorkTime(by resultCustomer: Int, with totaltime: Double) {
        do {
            let totalWorkTime = try totaltime.numberFormatter()
            printcalculateWorkTime(by: resultCustomer, with: totalWorkTime)
        } catch {
            printFailChange()
        }
    }
    
    mutating func giveTask(for customerList: BankItemQueue<Customer>) -> Double {
        var customerList = customerList
        let startTime = CFAbsoluteTimeGetCurrent()
        while let completeCustomer = customerList.deQueue() {
            bankmanager.handleBanking(for: completeCustomer)
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        return durationTime
    }
}
