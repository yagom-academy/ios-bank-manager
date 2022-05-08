//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol Customer {
    var waitingNumber: Int { get }
    var workType: Banking { get }
    var id: String { get }
    init(waitingNumber: Int, workType: Banking, id: String)
}

extension Customer {
    static func make(startNumber: Int, count: Int) -> [Self] {
        return (startNumber..<startNumber + count).map(makeCustomer)
    }

    private static func makeCustomer(number: Int) -> Self {
        let customerType = Banking.allCases.randomElement() ?? .deposit
        let customer = Self(waitingNumber: number, workType: customerType, id: UUID().uuidString)

        return customer
    }
}

struct BankCustomer: Customer {
    let waitingNumber: Int
    let workType: Banking
    let id: String
}
