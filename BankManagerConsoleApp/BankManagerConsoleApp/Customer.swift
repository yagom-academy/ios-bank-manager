//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/08/05.
//

import Foundation

enum BusinessType: CaseIterable {
    case deposit
    case loan
}

struct Customer {
    let numberTicket: Int
    let business: BusinessType
}
