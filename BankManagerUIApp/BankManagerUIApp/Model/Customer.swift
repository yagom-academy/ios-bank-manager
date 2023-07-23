//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

import Foundation

struct Customer: Hashable {
    let purpose: Work
    let waitingNumber: Int
    
    init?(waitingNumber: Int) {
        guard let work = Work.allCases.randomElement() else {
            return nil
        }
        purpose = work
        self.waitingNumber = waitingNumber
    }
}

extension Customer {
    enum Work: CaseIterable {
        case deposit
        case loan
        
        var duration: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
        
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
