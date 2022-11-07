//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Workable {
    
    func provideService(to customer: Customer?) {
        guard let customer = customer,
              let bankCustomer = customer as? BankCustomer else {
            return
        }
        
        print("\(bankCustomer.number)번 고객 업무 시작")
        usleep(700000)
        print("\(bankCustomer.number)번 고객 업무 완료")
    }
}
