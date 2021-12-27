//
//  Employee.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/24.
//

import Foundation

struct Employee {
    var bank: WaitingLineManageable?
    private let seconds = 0.7
    private var customerCount = 0
    var speaker = Speaker()
    
    func startJob() {
        guard let customer = bank?.waitingLine.first else {
            return
        }
        
        speaker.speak(when: .start, number: customer.waitingNumber)
    }
    
    mutating func finishJob() {
        guard let customer = bank?.waitingLine.dequeue() else {
            return
        }
        
        Thread.sleep(forTimeInterval: seconds)
        customerCount += 1
        
        speaker.speak(when: .finish, number: customer.waitingNumber)
    }
    
    func calculate(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) {
        let duration = closeTime - openTime
        
        guard let workTime = duration.toDecimal else {
            return
        }
        
        let close = Speaker.Situation.close(time: workTime)
        speaker.speak(when: close, number: customerCount)
    }
}

// MARK : - CFAbsoluteTime Extension

extension CFAbsoluteTime {
    var toDecimal: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(for: self)
    }
}
