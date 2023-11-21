//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Customer {
    private(set) var waitingNumber: Int
    private(set) var customerTask : String
    
    init(waitingNumber : Int, customerTask : String) {
        self.waitingNumber = waitingNumber
        self.customerTask = customerTask
    }
}
