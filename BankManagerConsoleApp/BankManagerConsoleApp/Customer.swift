//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, ttotale on 2022/11/03.
//

struct Customer {
    
    enum Service: CaseIterable {
        case deposit
        case loan
        
        var message: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }
    
    let number: Int
    let serviceType: Service
}
