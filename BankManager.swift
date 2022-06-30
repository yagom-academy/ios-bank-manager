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
        
        while let completeCustomer = customerList.deQueue() {
            print("\(completeCustomer.bankNumberTicket)" + BankManagerComment.handleBankingStart.rawValue)
            usleep(useconds_t(processingTime))
            print("\(completeCustomer.bankNumberTicket)" + BankManagerComment.handleBankingFinish.rawValue)
        }
    }
}
