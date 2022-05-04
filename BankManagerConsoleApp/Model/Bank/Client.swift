//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct Client {
    let waitingNumber: Int
    let taskType: TaskType

    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.taskType = TaskType.allCases.randomElement() ?? TaskType.deposit
    }
}
