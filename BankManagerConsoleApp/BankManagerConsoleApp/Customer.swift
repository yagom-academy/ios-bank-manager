//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

enum Banking: CaseIterable {
    case deposit
    case loans
    
    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loans:
            return 1.1
        }
    }
}

struct Customer {
    private let waitingNumber: Int
    private let bankingType: Banking?
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.bankingType = Banking.allCases.randomElement()
    }
    
    func getWaitingNumber() -> Int {
        return waitingNumber
    }
    
    func getBankingType() -> Banking? {
        return bankingType
    }
    
    func getBankingTime() -> Double {
        guard let bankingTime = bankingType?.processTime else { return 0.0 }
        return bankingTime
    }
}
