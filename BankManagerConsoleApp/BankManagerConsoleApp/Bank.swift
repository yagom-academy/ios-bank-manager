//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

protocol WaitingLineManageable {
    var waitingLine: Queue<Customer> { get set }
    var employee: Workable { get set }
}

class Bank: WaitingLineManageable {
    var waitingLine = Queue<Customer>()
    var employee: Workable
    
    func open() {
        let randomNumber = Int.random(in: 10...30)
        
        for number in 1...randomNumber {
            let customer = Customer(waitingNumber: number)
            
            waitingLine.enqueue(customer)
        }
        
        startWork()
    }
    
    func startWork() {
        while waitingLine.isEmpty == false {
            employee.doJob()
            employee.finishJob()
        }
    }
    
    init(employee: Workable) {
        self.employee = employee
        
        self.employee.bank = self
    }
}
