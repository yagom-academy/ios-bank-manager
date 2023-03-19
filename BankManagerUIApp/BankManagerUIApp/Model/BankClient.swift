//
//  BankClient.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

struct BankClient {
    let waitingNumber: Int
    let business: Business
}

extension BankClient: Equatable {
    static func ==(lhs: BankClient, rhs: BankClient) -> Bool {
        return lhs.waitingNumber == rhs.waitingNumber
    }
}
