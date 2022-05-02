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
        static let finishMessageFormat = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    }

    private var clientQueue: Queue<Client>
    private var totalWorkingTime: Double = 0
    private var finishedClientCount = 0

    private lazy var bankClerkQueue: Queue<BankClerk> = {
        var bankClerkQueue = Queue<BankClerk>()

        for _ in 1...Constant.clerkCount {
            let bankClerk = BankClerk()
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
            updateWorkData(spendedTime: bankClerk.spendingTimeForClient)
            bankClerkQueue.enqueue(bankClerk)
        }

        print(String(format: Constant.finishMessageFormat), finishedClientCount, totalWorkingTime)
    }

    private func updateWorkData(spendedTime: Double) {
        totalWorkingTime += spendedTime
        finishedClientCount += 1
    }
}
