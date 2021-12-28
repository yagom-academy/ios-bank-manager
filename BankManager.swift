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
    private let randomNumber = Int.random(in: 10...30)
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func work() {
        let openTime = CFAbsoluteTimeGetCurrent()
        
        lineUp()
        assignWork()
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        
        reportResult(from: openTime, to: closeTime)
    }
}

//MARK: - Private Methods

extension BankManager {
    private func lineUp() {
        for number in 1...randomNumber {
            let customer = Customer(waitingNumber: number)
            
            bank?.waitingLine.enqueue(customer)
        }
    }

    private func assignWork() {
        let bankManagerQueue = DispatchQueue(label: "BankManagerQueue")
        let dispatchGroup = DispatchGroup()
        
        let start = DispatchWorkItem {
            self.employee.startJob()
        }
        let finish = DispatchWorkItem {
            self.employee.finishJob()
            dispatchGroup.leave()
        }
        
        while self.bank?.waitingLine.isEmpty == false {
            dispatchGroup.enter()
            bankManagerQueue.async(execute: start)
            bankManagerQueue.asyncAfter(deadline: .now() + 0.7, execute: finish)
            
            dispatchGroup.wait()
        }
    }
    
    private func reportResult(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) {
        guard let calculateResult = calculator.calculate(from: openTime, to: closeTime) else {
            return
        }
        
        speaker.speakClose(number: randomNumber, time: calculateResult)
    }
}
