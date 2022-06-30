//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    mutating func handleBanking(customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        
        while let completeCuntomer = customerList.deQueue() {
            print("\(completeCuntomer.bankNumberTicket)번 고객 업무 시작")
            usleep(700000)
            print("\(completeCuntomer.bankNumberTicket)번 고객 업무 완료")
        }
    }
}
