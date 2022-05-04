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
    private let group = DispatchGroup()
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
            
            switch client.taskType {
            case .deposit:
                DispatchQueue.global().async(group: group) {
                    self.depositSemaphore.wait()
                    let depositBankClerk = DepositBankClerk()
                    depositBankClerk.work(client: client, delegate: self)
                    self.depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) {
                    self.loanSemaphore.wait()
                    let loanBankClerk = LoanBankClerk()
                    loanBankClerk.work(client: client, delegate: self)
                    self.loanSemaphore.signal()
                }
            }
        }
        group.wait()
        print(String(format: Constant.finishMessageFormat, finishedClientCount, checkTime()))
    }
}

extension Bank: BankDelegate {
    func updateWorkData() {
        finishedClientCount += 1
    }
}
extension Bank: Timer {
    func setTimer() {
        from = CFAbsoluteTimeGetCurrent()
    }
}
