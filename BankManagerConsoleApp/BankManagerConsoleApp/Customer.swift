//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct Customer {
    
    private var grade: CustomerGrade
    private var _bankTask: BankTask
    private var waitingNumber: Int
    var bankTask: BankTask {
        return _bankTask
    }
    
    init(waitingNumber: Int) {
        self.grade = CustomerGrade.random
        self._bankTask = BankTask(waitingNumber: waitingNumber, grade: grade)
        self.waitingNumber = waitingNumber
    }
    
}
