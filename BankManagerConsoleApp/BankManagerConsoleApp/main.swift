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

func takeNumberTicket(number: Int, workType: (Double, String)) -> Customer {
    let customer = Customer(bankNumberTicket: number, bankingType: workType)
    return customer
}

func makeCustomer() -> BankItemQueue<Customer> {
    var watingQueue = BankItemQueue<Customer>()
    let totalCustomer = setCustomerCount()
    let workType = [WorkType().deposit, WorkType().loan]
    for ticketNumber in SetNumber.minimumCustomerCount.rawValue...totalCustomer {
        guard let type = workType.randomElement() else { return watingQueue }
        let ticketHolder = takeNumberTicket(number: ticketNumber, workType: type)
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
