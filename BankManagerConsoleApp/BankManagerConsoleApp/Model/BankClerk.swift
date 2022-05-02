//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

final class BankClerk: Presentable {
    private let name: String
    private(set) var service: BankService
    
    init(name: String, service: BankService) {
        self.name = name
        self.service = service
    }
    
    func work(client: Client) {
        self.printStartTaskMessage(client: client)
        Thread.sleep(forTimeInterval: self.service.requiredTime)
        self.printFinishTaskMessage(client: client)
    }
}
