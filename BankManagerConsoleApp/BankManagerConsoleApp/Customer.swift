//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

struct Customer {
    enum Task :CaseIterable {
        case loan
        case deposit
        
        var name: String {
            switch self {
            case .loan:
                return "대출"
            case .deposit:
                return "예금"
            }
        }
        
        var time: useconds_t {
            switch self {
            case .loan :
                return 1_100_000
            case .deposit :
                return 700_000
            }
        }
    }
    
    let ticketNumber: Int
    let task: Task
}

extension Customer {
    
}
