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
        let processingStartMessage: String = "\(customer.number)번 고객 \(bankBusiness.description)업무 시작"
        print(processingStartMessage)
        Thread.sleep(forTimeInterval: bankBusiness.processingTimePerCustomer)
        let processingFinishMessage: String = "\(customer.number)번 고객 \(bankBusiness.description)업무 완료"
        print(processingFinishMessage)
    }
}
