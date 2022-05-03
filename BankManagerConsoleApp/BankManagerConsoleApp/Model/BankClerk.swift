//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

final class BankClerk: Presentable {
    private let name: String
    private(set) var bankService: BankServiceType
    
    init(name: String, service: BankServiceType) {
        self.name = name
        self.bankService = service
    }
    
    func work(client: Client) {
        self.printStartTaskMessage(client: client)
        Thread.sleep(forTimeInterval: self.bankService.requiredTime)
        self.printFinishTaskMessage(client: client)
    }
}
