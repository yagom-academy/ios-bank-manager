//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

struct Customer {
    private let waitingNumber: Int
    private let bankingService: BankingService?
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.bankingService = BankingService.allCases.randomElement()
    }
    
    func getWaitingNumber() -> Int {
        return waitingNumber
    }
    
    func getBankingServiceType() -> BankingService? {
        return bankingService
    }
    
    func getBankingProcessTime() -> Double {
        guard let processTime = bankingService?.processTime else { return 0.0 }
        return processTime
    }
}
