//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

struct Teller {
    func processCustomer(_ customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.numberTicket)번 고객 업무 완료")
    }
}
