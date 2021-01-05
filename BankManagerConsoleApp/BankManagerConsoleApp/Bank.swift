//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강인희 on 2021/01/05.
//

struct Bank {
    var serviceCounter: [BankClerk]
    var waitingList: [Client]
    var totalVistedClientsNumber: Int
    var totalProcessedClientsNumber: Int
    var totalOperatingTime: Float
    var initialNumberOfClients: Int {
        didSet {
            self.loadWaitingList(of: initialNumberOfClients)
        }
    }
    
    init() {
        self.serviceCounter = []
        self.waitingList = []
        self.totalVistedClientsNumber = 0
        self.totalProcessedClientsNumber = 0
        self.totalOperatingTime = 0.0
        self.initialNumberOfClients = 0
    }
    
    private mutating func loadWaitingList(of size: Int) {
        for i in 0..<size {
            let newClient = Client(waitingNumber: i, business: .basic)
            waitingList.append(newClient)
        }
    }
}
