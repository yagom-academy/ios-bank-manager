//
//  BankProcess.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct BankProcess {
    private enum BankProcessConstant {
        static let minClient = 10
        static let maxClient = 30
        static let clerkCount = 1
        static let spendingTimeForAClient: Double = 0.7
    }

    private var clientManeger: ClientManeger
    private var bank: Bank

    init() {
        clientManeger = ClientManeger(minClientCount: BankProcessConstant.minClient,
                                      maxClientCount: BankProcessConstant.maxClient)
        bank = Bank(clientQueue: clientManeger.makeClientQueue(),
                    clerkCount: BankProcessConstant.clerkCount,
                    spendingTimeForAClient: BankProcessConstant.spendingTimeForAClient)
    }
}
