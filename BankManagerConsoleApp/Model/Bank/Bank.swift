//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation


class Bank {
    private let clientQueue: Queue<Client>
    private let clerkCount: Int
    private let spendingTimeForAClient: Double
    private var totalWorkingTime: Double = 0
    private var finishedClientCount = 0

    init(clientQueue: Queue<Client>, clerkCount: Int, spendingTimeForAClient: Double) {
        self.clientQueue = clientQueue
        self.clerkCount = clerkCount
        self.spendingTimeForAClient = spendingTimeForAClient
    }
}
