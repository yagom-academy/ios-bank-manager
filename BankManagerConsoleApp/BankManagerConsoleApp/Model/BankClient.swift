//
//  BankClient.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

protocol Clientable {
    var bankType: TaskType { set get }
    var waitingNumber: Int { get }
}

struct BankClient: Clientable {
    var bankType: TaskType = TaskType.random
    var waitingNumber: Int
}
