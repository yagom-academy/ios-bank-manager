//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

protocol WaitingLineManageable {
    var waitingLine: Queue<Customer> { get }
}

class Bank: WaitingLineManageable  {
    let waitingLine = Queue<Customer>()
    private var employee: Employee
    private let randomNumber = Int.random(in: 10...30)
    
    init(employee: Employee) {
        self.employee = employee
        self.employee.bank = self
    }
    
    func open() {
        let openTime = CFAbsoluteTimeGetCurrent()
        
        lineUp()
        startWork()
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        employee.calculate(from: openTime, to: closeTime)
    }
}

//MARK: - Private Methods

extension Bank {
    private func lineUp() {
        for number in 1...randomNumber {
            let customer = Customer(waitingNumber: number)
            
            waitingLine.enqueue(customer)
        }
    }
    
    private func startWork() {
        while waitingLine.isEmpty == false {
            employee.doJob()
            employee.finishJob()
        }
    }
}
