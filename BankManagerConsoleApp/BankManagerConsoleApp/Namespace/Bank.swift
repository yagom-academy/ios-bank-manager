//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

enum Bank {
    static let emptyWaitingLine = 0

    static func printClosingMessage(totalClientCount: Int, totalWorkingTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClientCount)명이며, 총 업무시간은 \(totalWorkingTime)초입니다.")
    }
}
