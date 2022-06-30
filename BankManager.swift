//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    mutating func handleBanking(customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        let processingTime = 700000
        
        while let completeCuntomer = customerList.deQueue() {
            print("\(completeCuntomer.bankNumberTicket)" + BankManagerComment.handleBankingStart.rawValue)
            usleep(useconds_t(processingTime))
            print("\(completeCuntomer.bankNumberTicket)" + BankManagerComment.handleBankingFinish.rawValue)
        }
    }
}
