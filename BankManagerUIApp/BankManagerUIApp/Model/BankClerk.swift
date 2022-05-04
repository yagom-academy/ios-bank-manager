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
        
    }
}
