//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol BankManager {
    func handleBanking(customer: Customer)
}

extension BankManager {
    func handleBanking(customer: Customer) {
        let processingTime = 700000
        
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingStart.rawValue)
        usleep(useconds_t(processingTime))
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingFinish.rawValue)
    }
}
