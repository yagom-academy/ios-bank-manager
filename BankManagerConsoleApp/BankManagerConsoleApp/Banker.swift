//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 서현웅 on 2022/11/03.
//

import Foundation

struct Banker {
    let processingTimePerCustomer: Double = 0.7
    let oneMillion: Double = 1_000_000
    
    func processBankingBusiness(of customer: Customer) {
        let processingStartMessage: String = "\(customer.number)번 고객 업무 시작"
        print(processingStartMessage)
        usleep(UInt32(processingTimePerCustomer * oneMillion))
        let processingFinishMessage: String = "\(customer.number)번 고객 업무 완료"
        print(processingFinishMessage)
    }
}
