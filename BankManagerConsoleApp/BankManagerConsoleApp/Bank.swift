//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BaekGom on 2022/06/30.
//

import Foundation

struct Bank {
    private var customer: BankItemQueue<Customer>
    private let bankmanager: BankManager
    private let depositSemaphore = DispatchSemaphore(value: NumberOfBankManager.deposit.rawValue)
    private let loanSemaphore = DispatchSemaphore(value: NumberOfBankManager.loan.rawValue)
    private let bankingGroup = DispatchGroup()
    
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
            let totalTaskTime = calculateWorkingHour(for: customer)
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
    
    private func calculateWorkTime(by resultCustomer: Int, with totalTime: Double) {
        do {
            let totalWorkTime = try totalTime.numberFormatter()
            printcalculateWorkTime(by: resultCustomer, with: totalWorkTime)
        } catch {
            printFailChange()
        }
    }
    
    private func giveTask(for customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        while let completeCustomer = customerList.deQueue() {
            DispatchQueue.global().async(group: bankingGroup) {
                switch completeCustomer.bankingType {
                case .deposit:
                    self.depositSemaphore.wait()
                    self.bankmanager.handleBanking(for: completeCustomer)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    self.bankmanager.handleBanking(for: completeCustomer)
                    self.loanSemaphore.signal()
                }
            }
        }
    }
    
    private func calculateWorkingHour(for customerList: BankItemQueue<Customer>) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        giveTask(for: customerList)
        bankingGroup.wait()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        return durationTime
    }
}
