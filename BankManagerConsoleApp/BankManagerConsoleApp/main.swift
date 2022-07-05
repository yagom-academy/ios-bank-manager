//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func userInput() -> String {
    return readLine()?.trimmingCharacters(in: .whitespaces) ?? BankComment.emptyValue.rawValue
}

func setCustomerCount() -> Int {
    return Int.random(in: SetNumber.minCustomer.rawValue...SetNumber.maxCustomer.rawValue)
}

func takeNumberTicket(number: Int) -> Customer {
    let customer = Customer(bankNumberTicket: number)
    return customer
}

func makeCustomer() -> BankItemQueue<Customer> {
    var watingQueue = BankItemQueue<Customer>()
    let totalCustomer = setCustomerCount()
    for ticketNumber in SetNumber.minimumCustomerCount.rawValue...totalCustomer {
        let ticketHolder = takeNumberTicket(number: ticketNumber)
        watingQueue.enQueue(ticketHolder)
    }
    return watingQueue
}

func initiateBankBusiness() {
    let bankManager = BankManager()
    var bank = Bank(customer: makeCustomer(), bankmanager: bankManager)
    
    bank.bankBusinessStart()
}

initiateBankBusiness()
