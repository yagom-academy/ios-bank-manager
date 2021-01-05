//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강인희 on 2021/01/05.
//

struct Bank {
    var serviceCounter: [Int : BankClerk]
    var waitingList: [Client]
    var totalVistedClientsNumber: Int
    var totalProcessedClientsNumber: Int
    var totalOperatingTime: Float
    
    func assignCounter() {
        
    }
    
    func close() {
        
    }
}
