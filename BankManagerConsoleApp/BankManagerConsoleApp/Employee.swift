//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

protocol Workable {
    var bank: WaitingLineManageable { get set }
    func doJob()
    func finishJob()
}

struct Employee: Workable {
    var bank: WaitingLineManageable
    
    init(bank: WaitingLineManageable) {
        self.bank = bank
        
        self.bank.employee = self
    }
    
    func doJob() {
        guard let customer = bank.waitingLine.first else {
            return
        }
        print("\(customer.waitingNumber)번 고객 업무 시작")
    }
    
    func finishJob() {
        guard let customer = bank.waitingLine.dequeue() else {
            return
        }
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
