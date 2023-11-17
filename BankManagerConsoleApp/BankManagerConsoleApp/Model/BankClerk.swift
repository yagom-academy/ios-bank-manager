//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, toy on 11/16/23.
//
import Foundation
import BankManager

struct BankClerk: CustomerReceivable {
    private let pace = 0.7
    
    func receive(customer: Customer) {
        let number = customer.number
        
        print("\(number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: pace)
        print("\(number)번 고객 업무 완료")
    }
}
