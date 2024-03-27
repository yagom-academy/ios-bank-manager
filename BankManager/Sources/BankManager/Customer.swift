//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

import Foundation

struct Customer: Equatable, Identifiable {
    let id: String
    let waitingNumber: String
    let processingTime: Double
    
    init(number: Int) {
        self.id = UUID().uuidString
        self.waitingNumber = "\(number)번 고객"
        self.processingTime = 0.7
    }
    
    static func ==(lhs: Customer, rhs: Customer) -> Bool {
        return lhs.id == rhs.id
    }
}
