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
    
    func receive(customer: Customer, work: ((UInt, Double) -> Void)) {
        let number = customer.number
        
        work(number, pace)
    }
}
