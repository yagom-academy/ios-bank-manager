//
//  BankManagerConsoleApp - main.swift
//  Created by 수꿍, 브래드. 
//  Copyright © yagom academy. All rights reserved.
// 
let bradBanker = BankManager()
var yagomBank = Bank(banker: bradBanker)

yagomBank.run()
