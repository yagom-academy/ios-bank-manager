//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func handleBanking(for customer: Customer) {
        
        print("\(customer.bankNumberTicket)" + BankManagerComment.workInit.rawValue +
              "\(customer.bankingType.bankingName)" + BankManagerComment.workStart.rawValue)
        Thread.sleep(forTimeInterval: customer.bankingType.bankingProcessingTime)
        print("\(customer.bankNumberTicket)" + BankManagerComment.workInit.rawValue +
              "\(customer.bankingType.bankingName)" + BankManagerComment.workFinish.rawValue)
    }
}
