//
//  Operations.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

class HandleCustomerOperation: Operation {
    let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
        super.init()
    }
    
    override func main() {
        switch customer.task {
        case .deposit:
            handleDeposit()
        case .loan:
            handleLoan()
        }
    }
    
    private func handleDeposit() {
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 예금업무 시작")
        usleep(Bank.Task.deposit.time)
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 예금업무 완료")
    }
    
    private func handleLoan() {
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 대출업무 시작")
        usleep(Bank.Task.examineLoanDocument.time)
        BankHeadOffice.loanJudgement(customer: customer)
        usleep(Bank.Task.loan.time)
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 대출업무 완료")
    }
}

struct BankHeadOffice {
    static var semaphoreValue = 0 
    
    static func loanJudgement(customer: Customer) {
        while BankHeadOffice.semaphoreValue < 0 {} // wait until semaphoreValue is 0
        semaphoreValue -= 1
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 대출심사 시작")
        usleep(Bank.Task.judgementLoan.time)
        print("\(customer.ticketNumber)번 \(customer.priority.name)고객 대출심사 완료")
        semaphoreValue += 1
    }
}
