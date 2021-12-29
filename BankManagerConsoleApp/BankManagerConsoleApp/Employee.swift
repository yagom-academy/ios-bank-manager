//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

class Employee {
    var bank: WaitingLineManageable?
    let speaker = Speaker()
    var customerCount = 0
    
    func startLoanJob() {
        guard let customer = bank?.loanWaitingLine.first else {
            return
        }
                
        speaker.speakStart(for: customer.waitingNumber, workType: customer.requestedWork)
    }
    
    func finishLoanJob() {
        guard let customer = bank?.loanWaitingLine.dequeue() else {
            return
        }
        
        customerCount += 1

        speaker.speakFinish(for: customer.waitingNumber, workType: customer.requestedWork)
    }
    
    func startDepositJob() {
        guard let customer = bank?.depositWaitingLine.first else {
            return
        }
                
        speaker.speakStart(for: customer.waitingNumber, workType: customer.requestedWork)
    }
    
    func finishDepositJob(customer: Customer) {
        customerCount += 1

        speaker.speakFinish(for: customer.waitingNumber, workType: customer.requestedWork)
    }
}
