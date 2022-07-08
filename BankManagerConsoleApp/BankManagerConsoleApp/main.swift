//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func userInput() -> String {
    return readLine()?.trimmingCharacters(in: .whitespaces) ?? BankComment.emptyValue.rawValue
}

private func generateRandomNumber() -> Int {
    return Int.random(in: SetNumber.minCustomer.rawValue...SetNumber.maxCustomer.rawValue)
}

private func makeCustomer(number: Int, workType: (Double, BusinessType)) -> Customer {
    let customer = Customer(bankNumberTicket: number, bankingType: workType)
    return customer
}

private func lineUpCustomer() -> BankItemQueue<Customer> {
    var watingQueue = BankItemQueue<Customer>()
    let totalCustomer = generateRandomNumber()
    let workType = [WorkType().deposit, WorkType().loan]
    for ticketNumber in SetNumber.minimumCustomerCount.rawValue...totalCustomer {
        guard let type = workType.randomElement() else { return watingQueue }
        let ticketHolder = makeCustomer(number: ticketNumber, workType: type)
        watingQueue.enQueue(ticketHolder)
    }
    return watingQueue
}

func initiateBankBusiness() {
    let bankManager = BankManager()
    var bank = Bank(customer: lineUpCustomer(), bankmanager: bankManager)
    
    bank.bankBusinessStart()
}

initiateBankBusiness()
