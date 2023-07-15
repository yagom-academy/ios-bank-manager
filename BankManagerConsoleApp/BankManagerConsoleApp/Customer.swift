//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

struct Customer {
    private let waitingNumber: Int
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
    
    func getWaitingNumber() -> Int {
        return waitingNumber
    }
}
