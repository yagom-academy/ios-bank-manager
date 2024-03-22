//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gama, Gray on 2024/03/22.
//

public struct Bank {
    public var manager = BankManager()
    public var clients = BankQueue<Client>()
    
    public init() {
        
    }
}
