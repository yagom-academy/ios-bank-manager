//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct BankTeller {
    let duty: BankingService
        
    func doWork(for customer: Customer,
                startHandler: (Customer) -> Void = { _ in },
                completionHandler: (Customer) -> Void = { _ in }) {
        startHandler(customer)
        Thread.sleep(forTimeInterval: duty.duration)
        completionHandler(customer)
    }
}
