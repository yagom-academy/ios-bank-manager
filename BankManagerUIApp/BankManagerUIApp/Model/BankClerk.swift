//
//  BankClerk.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import Foundation

final class BankClerk {
    private let name: String
    private(set) var bankService: BankServiceType
    
    init(name: String, bankService: BankServiceType) {
        self.name = name
        self.bankService = bankService
    }
    
    func work(client: Client) {
        print("\(client.bankService)\(client.waitingNumber)업무시작")
        NotificationCenter.default.post(name: .didAssignClientToBankClerk, object: client)
        Thread.sleep(forTimeInterval: self.bankService.requiredTime)
        NotificationCenter.default.post(name: .didFinishWork, object: client)
        print("\(client.bankService)\(client.waitingNumber)업무종료")
    }
}
