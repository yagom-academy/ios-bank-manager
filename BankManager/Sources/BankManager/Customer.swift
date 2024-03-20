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
        self.processingTime = 0.7 // 고객 한명 당, 걸리는 시간
    }
}
