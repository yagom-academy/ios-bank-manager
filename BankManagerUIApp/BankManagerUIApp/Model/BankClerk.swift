//
//  BankClerk.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import Foundation

protocol BankClerkDelegate: AnyObject {
    func updateClientStackView(client: Client)
    func deleteClientStackView(client: Client)
}

final class BankClerk {
    private(set) var bankService: BankServiceType
    weak var delegate: BankClerkDelegate?
    
    init(bankService: BankServiceType) {
        self.bankService = bankService
    }
    
    func work(client: Client) {
        delegate?.updateClientStackView(client: client)
        Thread.sleep(forTimeInterval: self.bankService.requiredTime)
        delegate?.deleteClientStackView(client: client)
    }
}
