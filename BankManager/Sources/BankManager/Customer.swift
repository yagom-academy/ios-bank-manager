//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Customer {
    private(set) var waitingNumber: Int
    
    init(waitingNumber : Int, processingTime: Double) {
        self.waitingNumber = waitingNumber
    }
}
