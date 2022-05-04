//
//  DepositBankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/05/04.
//

import Foundation

struct DepositBankClerk: BankClerk {
    private enum Constant {
        static let spendingTimeForClient: Double = 0.7
    }
    
    let spendingTimeForClient = Constant.spendingTimeForClient
}
