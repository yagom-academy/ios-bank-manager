//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gama, Gray on 2024/03/22.
//

struct Bank {
    var managers = [BankManager]()
    var clients = BankQueue<Client>()
}
