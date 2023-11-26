//
//  File.swift
//  
//
//  Created by hyunMac on 11/19/23.
//

import Foundation

struct Teller {
    let processingTime: Double
    let tellerTask: String
    
    init(processingTime: Double, tellerTask: String) {
        self.processingTime = processingTime
        self.tellerTask = tellerTask
    }
    
    func tellerProcessing(_ customerNumber: Int) -> Double {
        print("\(customerNumber)번 고객 \(tellerTask)업무 시작")
        
        Thread.sleep(forTimeInterval: processingTime)
        
        print("\(customerNumber)번 고객 \(tellerTask)업무 완료")
        
        return processingTime
    }
}

