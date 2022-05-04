//
//  LoanBankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/05/04.
//

import Foundation

struct LoanBankClerk: BankClerk {
    private enum Constant {
        static let spendingTimeForClient: Double = 1.1
    }

    let spendingTimeForClient = Constant.spendingTimeForClient
}
