//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi, Mene on 2/11/2022.
//

import Foundation

struct Customer {
    let waitingNumber: Int
    let requestingTask: Banking
    
    enum Banking: Int {
        case deposit = 1
        case loan = 2
        
        var name: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }
}
