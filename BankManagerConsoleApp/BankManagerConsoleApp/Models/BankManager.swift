//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Workable {
    
    func provideService(to customer: Customer?) {
        guard let customer = customer,
              let bankCustomer = customer as? BankCustomer,
              let workType = bankCustomer.type else {
            return
        }
        let sleepTime: UInt32 = workType.rawValue == "예금" ? 700000 : 1100000
        
        print("\(bankCustomer.number)번 고객 \(workType.rawValue)업무 시작")
        usleep(sleepTime)
        print("\(bankCustomer.number)번 고객 \(workType.rawValue)업무 완료")
    }
}
