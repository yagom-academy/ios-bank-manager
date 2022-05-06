//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

final class Bank {
    private enum Constant {
        static let finishMessageFormat = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
        static let loanBankClerkCount = 1
        static let depositBankClerkCount = 2
    }

    private var clientQueue: Queue<Client>
    private var finishedClientCount = 0
    private let loanSemaphore = DispatchSemaphore(value: Constant.loanBankClerkCount)
    private let depositSemaphore = DispatchSemaphore(value: Constant.depositBankClerkCount)
    private let bankGroup = DispatchGroup()
    var from: CFAbsoluteTime?

    init(clientQueue: Queue<Client>) {
        self.clientQueue = clientQueue
    }

    func startWork() {
        setTimer()
        while clientQueue.isEmpty() == false {
            guard let client = clientQueue.dequeue() else {
                return
            }
            DispatchQueue.global().async(group: bankGroup) {
                let taskTypeSemphore = self.semaphore(taskType: client.taskType)
                taskTypeSemphore.wait()
                let bankClerk = BankClerk()
                bankClerk.work(client: client) {
                    self.finishedClientCount += 1
                }
                taskTypeSemphore.signal()
            }
        }
        bankGroup.wait()
        print(String(format: Constant.finishMessageFormat, finishedClientCount, checkTime()))
    }

    private func semaphore(taskType: TaskType) -> DispatchSemaphore {
        switch taskType {
        case .deposit:
            return depositSemaphore
        case .loan:
            return loanSemaphore
        }
    }
}

extension Bank: Timer {
    func setTimer() {
        from = CFAbsoluteTimeGetCurrent()
    }
}
