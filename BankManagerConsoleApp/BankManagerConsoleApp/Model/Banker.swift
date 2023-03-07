//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct Banker {
    let name: String
    let processTime: Double = 0.7
    
    func doWork(for customer: Customer?) {
        guard let currentCustomer = customer else { return }
        
        print("\(currentCustomer.numberTicket)번 고객 업무 시작")
        sleep(UInt32(processTime))
        print("\(currentCustomer.numberTicket)번 고객 업무 완료")
    }
}
