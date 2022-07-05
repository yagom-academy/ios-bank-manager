//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func handleBanking(for customer: Customer) {
        
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingStart.rawValue)
        usleep(useconds_t(customer.bankingType))
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingFinish.rawValue)
    }
}
