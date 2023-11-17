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
    
    func receive(customer: Customer, work: ((UInt, Double) -> Void)) {
    init(startWork: @escaping (String) -> Void = { print($0) }, endWork: @escaping (String) -> Void = { print($0) }) {
        self.startWork = startWork
        self.endWork = endWork
    }
        let number = customer.number
        
        work(number, pace)
    }
}
