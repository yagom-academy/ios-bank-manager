//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let loanClerk1 = LoanBankClerk(bankingType: .loan,
                               processingTime: 1.1,
                               counter: DispatchQueue(label: "1"))
let depositClerk2 = DepositBankClerk(bankingType: .deposit,
                                     processingTime: 0.7,
                                     counter: DispatchQueue(label: "2"))
let depositClerk3 = DepositBankClerk(bankingType: .deposit,
                                     processingTime: 0.7,
                                     counter: DispatchQueue(label: "3"))
let bank = Bank(bankClerks: [loanClerk1, depositClerk2, depositClerk3])
var bankManager = BankManager(bank: bank)

bankManager.startManagement()
