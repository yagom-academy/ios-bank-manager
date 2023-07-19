//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

struct Customer {
    let numberTicket: Int
    let service: BankingService
    
    init(numberTicket: Int) {
        self.numberTicket = numberTicket
        let range = 0..<BankingService.allCases.count
        self.service = BankingService.allCases[Int.random(in: range)]
    }
}
