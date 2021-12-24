//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

struct Employee {
    var bank: WaitingLineManageable?
    
    func doJob() {
        guard let customer = bank?.waitingLine.first else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 업무 시작")
    }
    
    func finishJob() {
        guard let customer = bank?.waitingLine.dequeue() else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
