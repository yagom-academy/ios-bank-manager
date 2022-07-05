//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
 
struct BankManager {
    var totalHandlingTime: TimeInterval = 0
    
    mutating func handle(customer: Customer) {
        let customerNumber = customer.number
        let customerBusiness = customer.business
        
        print("\(customerNumber)번 고객 \(customerBusiness.name)업무 시작")
        Thread.sleep(forTimeInterval: customerBusiness.processTime)
        print("\(customerNumber)번 고객 \(customerBusiness.name)업무 완료")
        
        totalHandlingTime += customerBusiness.processTime
    }
}

