//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, toy
//

import BankManager

struct Customer: CustomerNumbering {
    let number: UInt
    let banking = Banking.allCases.randomElement()
}
