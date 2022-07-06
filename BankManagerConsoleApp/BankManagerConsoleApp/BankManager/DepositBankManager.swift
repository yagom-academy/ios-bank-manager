//
//  DepositBankManager.swift
//  Created by 수꿍, 브래드.
//  Copyright © yagom academy. All rights reserved.
//

struct DepositBankManager: Banker {
    let time = Namespace.requiredTimeForDeposit
    let task = Namespace.deposit
}
