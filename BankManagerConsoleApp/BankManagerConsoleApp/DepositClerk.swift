//
//  DepositClerk.swift
//  BankManagerConsoleApp
//
//  Created by jin on 11/10/22.
//

import Foundation

struct DepositClerk: Workable {
    var processingTime: Double = 0.7
    static var serviceQueue: DispatchQueue = DispatchQueue(label: "deposit")
    var service: Service = Service.deposit
}
