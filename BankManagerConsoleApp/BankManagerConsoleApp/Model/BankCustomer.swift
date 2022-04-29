//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

protocol Customer {
    var waitingNumber: Int { get }
}

struct BankCustomer: Customer {
    let waitingNumber: Int
}
