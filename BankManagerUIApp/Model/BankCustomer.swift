//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

protocol Customer {
    var waitingNumber: Int { get }
    var workType: Banking { get }
    init(waitingNumber: Int, workType: Banking)
}

extension Customer {
    static func make(numberOfCustomer: Int) -> [Self] {
        return (1...10).map(makeCustomer)
    }

    private static func makeCustomer(number: Int) -> Self {
        let customerType = Banking.allCases.randomElement() ?? .deposit
        let customer = Self(waitingNumber: number, workType: customerType)

        return customer
    }
}

struct BankCustomer: Customer {
    let waitingNumber: Int
    let workType: Banking
}
