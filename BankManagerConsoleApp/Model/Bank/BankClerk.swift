//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

protocol BankDelegate {
    func updateWorkData(spendedTime: Double)
}

private enum Constant {
    static let startWorkMessage = "고객 업무 시작"
    static let finishedWorkMessage = "고객 업무 완료"
    static let spendingTimeForClient: Double = 0.7
}

protocol BankClerk {
    var spendingTimeForClient: Double { get }

    func work(client: Client, delegate: BankDelegate)
}

extension BankClerk {
    func work(client: Client, delegate: BankDelegate) {
        print("\(client.waitingNumber) \(Constant.startWorkMessage)")
        let usecondsTimeForAClient = useconds_t(spendingTimeForClient * 1000000)
        usleep(usecondsTimeForAClient)
        delegate.updateWorkData(spendedTime: spendingTimeForClient)
        print("\(client.waitingNumber) \(Constant.finishedWorkMessage)")
    }
}
