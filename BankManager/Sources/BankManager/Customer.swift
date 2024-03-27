//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Customer {
    var waitingNumber: String
    var processingTime: Double
    
    init(number: Int) {
        self.waitingNumber = "\(number)번 고객"
        self.processingTime = 0.7
    }
}
