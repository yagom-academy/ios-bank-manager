//  BankManagerConsoleApp - BankingServiceMaker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

enum BankingServiceMaker {
    static func makeRandomService() -> BankingService? {
        let randomNumber: Int = Int.random(in: 1...3)
        let loanFlag: Int = 1
        let savingAccountFlag: Int = 2
        let creditCardIssuanceFlag: Int = 3
        
        switch randomNumber {
        case loanFlag:
            return Loan()
        case savingAccountFlag:
            return SavingAccount()
        case creditCardIssuanceFlag:
            return CreditCardIssuance()
        default:
            return nil
        }
    }
}
