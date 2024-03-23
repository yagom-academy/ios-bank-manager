//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Customer {
    var name: String
    var processingTime: Double
    
    init(number: Int) {
        self.name = "\(number)번 고객"
        self.processingTime = 0.7
    }
}
