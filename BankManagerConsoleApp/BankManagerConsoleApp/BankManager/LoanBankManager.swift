//
//  LoanBankManager.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/05.
//

struct LoanBankManager: Banker {
    let time = Namespace.requiredTimeForLoan
    let task = Namespace.loan
}
