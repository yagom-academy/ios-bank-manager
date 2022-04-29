//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

protocol Customer {
    var waitingNumber: Int { get }
    init(waitingNumber: Int)
}

extension Customer {
    static func randomCustomers() -> [Self] {
        var customers = [Self]()
        let customerCount = Int.random(in: 10...30)
        for number in 1...customerCount {
            customers.append(Self(waitingNumber: number))
        }

        return customers
    }
}

struct BankCustomer: Customer {
    let waitingNumber: Int
}
