//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
 
struct BankManager {
    var delegate: WorkProtocol?
    
    func handle(customer: Customer) {
        let processTime = customer.business.processTime
        
        delegate?.startProcess(about: customer)
        Thread.sleep(forTimeInterval: processTime)
        delegate?.endProcess(about: customer)
    }
}

