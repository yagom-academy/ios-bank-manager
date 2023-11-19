//
//  File.swift
//  
//
//  Created by hyunMac on 11/19/23.
//

import Foundation

struct Teller {
    let processingTime: Double
    
    init(processingTime: Double) {
        self.processingTime = processingTime
    }
    
    func tellerProcessing(_ customerNumber: Int) -> Double {
        print("\(customerNumber)번 고객 업무 시작")
        
        Thread.sleep(forTimeInterval: processingTime)
        
        print("\(customerNumber)번 고객 업무 완료")
        
        return processingTime
    }
}

