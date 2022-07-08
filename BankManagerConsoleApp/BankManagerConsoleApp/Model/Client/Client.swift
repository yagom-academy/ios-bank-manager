//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

struct Client {
    private(set) var waitingNumber: Int
    private(set) var request: Request
    
    init(request: Request, waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.request = request
    }
}
