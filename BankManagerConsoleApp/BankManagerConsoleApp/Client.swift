//
//  Client.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

struct Client {
    enum BankingType: String {
        case deposit = "예금"
        case loan = "대출"
    }
    
    let clientWaitingNumber: Int
    let bankingType: BankingType
    var bankingTime: Double {
        switch bankingType {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
