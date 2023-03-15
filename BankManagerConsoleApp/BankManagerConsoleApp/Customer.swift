//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

import UIKit

struct Customer {
    let waitingNumber: Int
    let desiredBanking: Banking
    
    var fontColor: UIColor {
        switch desiredBanking {
        case .deposit:
            return .label
        case .loan:
            return .systemIndigo
        }
    }
}
