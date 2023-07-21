//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

struct Customer {
    let numberTicket: Int
    let service: BankingService = BankingService.random()
    
    init(numberTicket: Int) {
        self.numberTicket = numberTicket
    }
}
