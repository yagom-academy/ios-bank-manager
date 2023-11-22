//
//  BankManager.swift
//
//
//  Created by Hisop on 2023/11/17.
//

public struct BankManager {
    public var bank: Bank

    public init(bankName: String, chargeDepositCount: Int = 2, chargeLoanCount: Int = 1) {
        bank = Bank(name: bankName, chargeDepositCount: chargeDepositCount, chargeLoanCount: chargeLoanCount)
    }
}
