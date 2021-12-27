//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var employee: Employee
    var bank: WaitingLineManageable?
    let calculator = Calculator()
    let randomNumber = Int.random(in: 10...30)
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func open() {
        let openTime = CFAbsoluteTimeGetCurrent()
        
        lineUp()
        assignWork()
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        
        guard let calculateResult = calculator.calculate(from: openTime, to: closeTime) else {
            return
        }
        
        let close = Speaker.Situation.close(time: calculateResult)
        
        Speaker.speak(when: close, number: randomNumber)
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
        while bank?.waitingLine.isEmpty == false {
            employee.startJob()
            employee.finishJob()
        }
    }
}
