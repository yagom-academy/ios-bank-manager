//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

final class Bank {
    private enum Constant {
        static let clerkCount = 1
        static let spendingTimeForAClient: Double = 0.7
    }
    
    private var clientQueue: Queue<Client>
    private(set) var totalWorkingTime: Double = 0
    private(set) var finishedClientCount = 0

    private lazy var bankClerkQueue: Queue<BankClerk> = {
        var bankClerkQueue = Queue<BankClerk>()

        for _ in 1...Constant.clerkCount {
            let bankClerk = BankClerk(bank: self, spendingTimeForAClient: Constant.spendingTimeForAClient)
            bankClerkQueue.enqueue(bankClerk)
        }

        return bankClerkQueue
    }()

    init(clientQueue: Queue<Client>) {
        self.clientQueue = clientQueue
    }

    func startWork() {
        while clientQueue.isEmpty() == false {
            guard let bankClerk = bankClerkQueue.dequeue(),
                  let client = clientQueue.dequeue()
            else {
                return
            }
            
            bankClerk.work(client: client)
            bankClerkQueue.enqueue(bankClerk)
        }
    }

    func updateWorkData(spendedTime: Double) {
        totalWorkingTime += spendedTime
        finishedClientCount += 1
    }
}
