//
//  Client.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

struct Client {
    enum Banking: CaseIterable{
        case deposit
        case loan
    }
    
    let clientWaitingNumber: Int
    let banking: Banking
    var bankingTime: Double {
        switch banking {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var bankingText: String {
        switch banking {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
