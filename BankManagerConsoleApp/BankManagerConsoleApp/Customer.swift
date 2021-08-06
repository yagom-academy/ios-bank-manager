//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    //MARK: Properties
    var ticketNumber: Int
    var business: String?
    
    init(ticketNumber: Int) {
        self.ticketNumber = ticketNumber
        self.business = BankBusiness.allCases.randomElement()?.task
    }
}
