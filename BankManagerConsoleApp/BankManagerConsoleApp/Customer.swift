//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    var ticketNumber: Int
    var business: String?
    
    enum BankBusiness: String, CaseIterable {
        case loan = "대출"
        case deposit = "예금"
        
        var task: String {
            self.rawValue
        }
    }
    
    init(ticketNumber: Int) {
        self.ticketNumber = ticketNumber
        self.business = BankBusiness.allCases.randomElement()?.task
    }
}
