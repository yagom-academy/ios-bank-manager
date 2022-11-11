//
//  Bankable.swift
//  BankManagerConsoleApp

import Foundation

protocol Bankable {
    var waitingLine: Queue<Customer> { get set }
    var handledCustomerCount: Int { get set }
    var bankingServiceGroup: DispatchGroup { get }
    
    mutating func allocateCustomer()
}

extension Bankable {
    mutating func addCustomer(_ customer: Customer) {
        self.waitingLine.enqueue(customer)
    }
    
    mutating func resetHandledCustomerCount() {
        self.handledCustomerCount = 0
    }
}
