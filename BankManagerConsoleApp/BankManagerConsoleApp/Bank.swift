//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by redmango1446 on 2023/07/13.
//

import Foundation

struct Bank {
    let bankers: [Banker]
    let customerQueue: CustomerQueue<Customer> = CustomerQueue()
}
