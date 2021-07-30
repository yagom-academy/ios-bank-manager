//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

class Bank {
    var bankTellers = [BankTeller]()
    var customerQueue = Queue<Customer>()
    var totalNumberOfVisitors: UInt = .zero
}
