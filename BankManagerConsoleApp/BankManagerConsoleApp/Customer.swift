//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Customer {
    private(set) var waitingNumber: Int
    private(set) var processingTime: Double
    
    init(waitingNumber : Int, processingTime: Double) {
        self.waitingNumber = waitingNumber
        self.processingTime = processingTime
    }
}
