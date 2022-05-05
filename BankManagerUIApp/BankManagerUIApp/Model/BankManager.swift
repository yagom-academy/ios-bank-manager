//
//  BankManager.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct BankManager {
    private let numberOfCustomer: Int = 10
    var bank: Bank = Bank(numberOfCustomer: 0)
    var status: Status = .notRunning

    mutating func startBanking() {
        setUpBank()
        if status == .notRunning {
            status = .running
            bank.work()
        }
    }

    private mutating func setUpBank() {
        bank.setUpCustomer(numberOfCustomer)
    }
}

extension BankManager {
    enum Status {
        case running
        case notRunning
    }
}
