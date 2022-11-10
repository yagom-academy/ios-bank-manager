//
//  LoanClerk.swift
//  BankManagerConsoleApp
//
//  Created by jin on 11/10/22.
//

import Foundation

struct LoanClerk: Workable {
    var processingTime: Double = 1.1
    static var serviceQueue: DispatchQueue = DispatchQueue(label: "loan")
    var service: Service = Service.loan
}
