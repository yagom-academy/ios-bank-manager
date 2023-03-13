//
//  Client.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

struct Client {
    enum BankingType: CaseIterable{
        case deposit
        case loan
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
    
    var bankingTypeText: String {
        switch bankingType {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
