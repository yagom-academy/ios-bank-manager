//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

struct Client {
    let waitingNumber: Int
    let desiredServices: String
    
    init(waitingNumber: Int, desiredServices: String) {
        self.waitingNumber = waitingNumber
        self.desiredServices = desiredServices
    }
}
