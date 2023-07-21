//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct Bank: Openable {
    private var customerQueue: Queue<Customer> = Queue()
    private var numberOfCustomer: Int = 0
    private var timeTracker = TimeTracker()
    
    private let printStartMessage: (Customer) -> Void = { customer in
        print(String(format: MessageFormat.startTask, customer.numberTicket, customer.service.description))
    }
    
    private let printFinishMessage: (Customer) -> Void = { customer in
        print(String(format: MessageFormat.finishTask, customer.numberTicket, customer.service.description))
    }
    
    mutating func open(numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
        handOutNumberTickets()
        startBusiness()
        closeBusiness()
    }
        
    mutating private func handOutNumberTickets() {
        (0..<numberOfCustomer).forEach {
            customerQueue.enqueue(Customer(numberTicket: $0 + 1))
        }
    }
    
    mutating private func startBusiness() {
        let group = DispatchGroup()
        let depositDepartment = BankDepartment(numberOfBankTeller: 2, group: group)
        let loanBankDepartment = BankDepartment(numberOfBankTeller: 1, group: group)
        timeTracker.startTime = CFAbsoluteTimeGetCurrent()
        
        while let currentCustomer = customerQueue.dequeue() {
            switch currentCustomer.service {
            case .deposit:
                depositDepartment.takeOnTask(for: currentCustomer,
                                             startHandler: printStartMessage,
                                             completionHandler: printFinishMessage)
            case .loan:
                loanBankDepartment.takeOnTask(for: currentCustomer,
                                              startHandler: printStartMessage,
                                              completionHandler: printFinishMessage)
            }
        }
        group.wait()
        timeTracker.endTime = CFAbsoluteTimeGetCurrent()
    }
    
    private func closeBusiness() {
        print(String(format: MessageFormat.closing, numberOfCustomer, timeTracker.duration))
    }
}

extension Bank {
    private enum MessageFormat {
        static let closing: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %u명이며, 총 업무시간은 %.2f입니다."
        static let startTask: String = "%u번 고객 %@ 시작"
        static let finishTask: String = "%u번 고객 %@ 완료"
    }
}
