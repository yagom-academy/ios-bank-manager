//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var employee: Employee
    var bank: WaitingLineManageable?
    private let speaker = Speaker()
    private let calculator = Calculator()
    private let employeeGroup = DispatchGroup()
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private var customerCount = 0

    init(employee: Employee) {
        self.employee = employee
    }
    
    func work() {
        let openTime = CFAbsoluteTimeGetCurrent()
        
        lineUp()
        assignWork()
        
        employeeGroup.wait()
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        
        reportResult(from: openTime, to: closeTime)
    }
}

//MARK: - Private Methods

extension BankManager {
    private func lineUp() {
        let randomNumber = Int.random(in: 10...30)
        for number in 1...randomNumber {
            let bankWork = BankWork.allCases.randomElement()!
            let customer = Customer(waitingNumber: number, requestedWork: bankWork)
            
            bank?.waitingLine.enqueue(customer)
        }
    }
    
    private func assignWork() {
        while let customer = bank?.waitingLine.dequeue() {
            switch customer.requestedWork {
            case .deposit:
                DispatchQueue.global().async(group: employeeGroup) {
                    self.depositSemaphore.wait()
                    self.employee.work(for: customer)
                    self.customerCount += 1
                    self.depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: employeeGroup) {
                    self.loanSemaphore.wait()
                    self.employee.work(for: customer)
                    self.customerCount += 1
                    self.loanSemaphore.signal()
                }
            }
        }
    }
    
    private func reportResult(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) {
        guard let calculateResult = calculator.calculate(from: openTime, to: closeTime) else {
            return
        }
        
        speaker.speakClose(number: self.customerCount, time: calculateResult)
    }
}
