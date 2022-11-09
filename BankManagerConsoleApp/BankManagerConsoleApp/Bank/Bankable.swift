//
//  Bankable.swift
//  BankManagerConsoleApp

import Foundation

protocol Bankable: AnyObject {
    var waitingLine: Queue<Customer> { get set }
    var handledCustomerCount: Int { get set }
    var bankingServiceGroup: DispatchGroup { get }
    
    func allocateCustomer()
}

extension Bankable {
    func addCustomer(_ customer: Customer) {
        self.waitingLine.enqueue(customer)
    }
    
    func resetHandledCustomerCount() {
        self.handledCustomerCount = 0
    }
}
