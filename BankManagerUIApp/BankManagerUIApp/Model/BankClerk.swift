//
//  BankClerk.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import Foundation

final class BankClerk {
    private(set) var bankService: BankServiceType
    
    init(bankService: BankServiceType) {
        self.bankService = bankService
    }
    
    func work(client: Client) {
        NotificationCenter.default.post(name: .didAssignClientToBankClerk, object: client)
        Thread.sleep(forTimeInterval: self.bankService.requiredTime)
        NotificationCenter.default.post(name: .didFinishWork, object: client)
    }
}
