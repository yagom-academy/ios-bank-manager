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
        static let finishMessageFormat = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
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

    func start() {
        bank.startWork()
        printBankFinish()
    }

    func printBankFinish() {
        let totalClientCount = bank.finishedClientCount
        let totalWorkingTime = bank.totalWorkingTime

        print(String(format: BankProcessConstant.finishMessageFormat, totalClientCount, totalWorkingTime))
    }
}
