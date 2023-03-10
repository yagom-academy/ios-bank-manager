//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct Banker {
    func doWork(for customer: Customer) {
        let startMessage = "\(customer.numberTicket)번 고객 \(customer.business.rawValue)업무 시작"
        let endMessage = "\(customer.numberTicket)번 고객 \(customer.business.rawValue)업무 완료"
  
        print(startMessage)
        Thread.sleep(forTimeInterval: customer.business.processTime)
        print(endMessage)
    }
}
