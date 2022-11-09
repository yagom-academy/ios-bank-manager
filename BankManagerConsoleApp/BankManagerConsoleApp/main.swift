//
//  BankManagerConsoleApp - main.swift
//  Created by sunnycookie, inho
//

import Foundation

let depositClerk1 = BankClerk(bankingType: .deposit,
                              processingTime: 0.7,
                              counter: DispatchQueue(label: "depositCounter1"))
let depositClerk2 = BankClerk(bankingType: .deposit,
                              processingTime: 0.7,
                              counter: DispatchQueue(label: "depositCounter2"))
let loanClerk1 = BankClerk(bankingType: .loan,
                           processingTime: 1.1,
                           counter: DispatchQueue(label: "loanCounter1"))
let bank = Bank(bankClerks: [depositClerk1, depositClerk2, loanClerk1])
var bankManager = BankManager(bank: bank)

bankManager.startManagement()
