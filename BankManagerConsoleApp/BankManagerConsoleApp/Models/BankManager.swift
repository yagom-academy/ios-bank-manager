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
              let workType = bankCustomer.purpose else {
            return
        }
        let serviceTime: UInt32 = workType.rawValue == "예금" ? Namespace.depositDelay : Namespace.loanDelay
        
        print("\(bankCustomer.number)번 고객 \(workType.rawValue)업무 시작")
        usleep(serviceTime)
        print("\(bankCustomer.number)번 고객 \(workType.rawValue)업무 완료")
    }
}
