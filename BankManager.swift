//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func handleBanking(customer: Customer, processingTime: WorkType) {
        
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingStart.rawValue)
        usleep(useconds_t(processingTime.workTime))
        print("\(customer.bankNumberTicket)" + BankManagerComment.handleBankingFinish.rawValue)
    }
}
