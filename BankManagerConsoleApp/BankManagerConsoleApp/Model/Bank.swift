//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

final class Bank {
    var clerks: [BankClerk] = []
    var clients: Queue<Client> = Queue()
    var clientCount: Int
    
    init(clientCount: Int) {
        self.clientCount = clientCount
    }
}
