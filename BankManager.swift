//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    let customerCount: Int = Int.random(in: 10...30)
    let bankClerkCount: Int
    var waitingList: [Custmer] = []
    var bankClerks: [BankClerk] = []
    
    func holdCustomers() {
        for index in 1...customerCount {
            self.waitingList.append(Custmer(index: index, taskTime: 0.7))
        }
    }
    
    func makeBankClerk() {
        for index in 1...bankClerkCount {
            self.bankClerks.append(BankClerk(bankWindowNumber: index))
        }
    }
    
    func beReportedWork() {
        guard waitingList.isEmpty else {
            return
        }
        for bankClerk in bankClerks {
            let closedMessage = String(format: ClerkWork.ClosedMessage.rawValue, bankClerk.bankWindowNumber, bankClerk.finishedCustomerNumber, bankClerk.totalTaskTime)
            print(closedMessage)
        }
    }
    
    func work() {
        while !waitingList.isEmpty {
            for bankClerk in bankClerks {
                if bankClerk.working == false {
                    bankClerk.work()
                }
            }
        }
    }

    init(bankClerkCount: Int) {
        self.bankClerkCount = bankClerkCount
    }
}
