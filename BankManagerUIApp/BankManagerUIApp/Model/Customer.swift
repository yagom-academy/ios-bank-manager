//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

struct Customer {
    let businessType: BusinessType
    let waitingNumber: Int
    
    init?(waitingNumber: Int) {
        guard let businessType = BusinessType.allCases.randomElement() else { return nil }
        
        self.businessType = businessType
        self.waitingNumber = waitingNumber
    }
}
