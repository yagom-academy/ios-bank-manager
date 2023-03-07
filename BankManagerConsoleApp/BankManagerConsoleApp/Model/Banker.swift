//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct Banker {
    static let processTime: Double = 0.7
    
    func doWork(for customer: Customer?) {
        guard let currentCustomer = customer else { return }
        
        let startMessage = "\(currentCustomer.numberTicket)번 고객 업무 시작"
        let endMessage = "\(currentCustomer.numberTicket)번 고객 업무 완료"
        
        print(startMessage)
        Thread.sleep(forTimeInterval: Banker.processTime)
        print(endMessage)
    }
}
