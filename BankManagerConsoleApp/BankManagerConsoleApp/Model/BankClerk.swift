//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, toy on 11/16/23.
//
import Foundation
import BankManager

struct BankClerk: Receivable {
    let pace = 0.7
    
    func receive(customer: Customer) {
        let number = customer.number
        let uSeconds = UInt32(pace * 1000000)
        
        print("\(number)번 고객 업무 시작")
        usleep(uSeconds)
        print("\(number)번 고객 업무 완료")
    }
}
