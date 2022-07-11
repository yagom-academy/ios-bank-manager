//
//  DepositBankManager.swift
//  Created by 수꿍, 브래드.
//  Copyright © yagom academy. All rights reserved.
//

struct DepositBankManager: Banker {
    let time = Constant.requiredTimeForDeposit
    let task = Task.deposit
}
