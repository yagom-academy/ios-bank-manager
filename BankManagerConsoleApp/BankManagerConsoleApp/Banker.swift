//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/03.
//

import Foundation

struct Banker {
    let bankBusiness: BankBusiness
    
    func processBankingBusiness(of customer: Customer) {
        let processingStartMessage: String = NameSpace.processingStartMessage(customerNumber: customer.number, bankBusinessDescription: bankBusiness.description)
        print(processingStartMessage)
        Thread.sleep(forTimeInterval: bankBusiness.processingTimePerCustomer)
        let processingFinishMessage: String = NameSpace.processingFinishMessage(customerNumber: customer.number, bankBusinessDescription: bankBusiness.description)
        print(processingFinishMessage)
    }
}
