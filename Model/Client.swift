//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/08/02.
//

import Foundation

struct Client {
    let waitingNumber: Int
    let bankingTask: BankingTask = BankingTask.allCases.randomElement() ?? .deposit
}
