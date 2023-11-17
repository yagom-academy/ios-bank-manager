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
    private let startWork: (String) -> Void
    private let endWork: (String) -> Void
    
    init(startWork: @escaping (String) -> Void = { print($0) }, endWork: @escaping (String) -> Void = { print($0) }) {
        self.startWork = startWork
        self.endWork = endWork
    }
    
    func receive(customer: Customer) {
        let number = customer.number
        
        startWork("\(number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: pace)
        endWork("\(number)번 고객 업무 종료")
    }
}
