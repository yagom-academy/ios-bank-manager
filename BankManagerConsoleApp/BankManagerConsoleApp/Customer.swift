//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct Customer {
    
    private(set) var grade: CustomerGrade
    private(set) var waitingNumber: Int

    init(waitingNumber: Int) {
        self.grade = CustomerGrade.random
        self.waitingNumber = waitingNumber
    }
    
}
