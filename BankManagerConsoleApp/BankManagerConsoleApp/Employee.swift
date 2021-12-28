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
    private let seconds = 0.7
    private var customerCount = 0
    
    func startJob() {
        guard let customer = bank?.waitingLine.first else {
            return
        }
        
        speaker.speakStart(for: customer.waitingNumber)
    }
    
    func finishJob() {
        guard let customer = bank?.waitingLine.dequeue() else {
            return
        }
        
        customerCount += 1
        
        speaker.speakFinish(for: customer.waitingNumber)
    }
}
