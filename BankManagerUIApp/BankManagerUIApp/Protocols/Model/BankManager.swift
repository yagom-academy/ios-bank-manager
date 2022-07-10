//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
 
struct BankManager {
    
    func handle(customer: Customer) {
        let processTime = customer.business.processTime
        
        Thread.sleep(forTimeInterval: processTime)
    }
}

