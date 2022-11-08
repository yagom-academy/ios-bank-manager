//
//  Bankable.swift
//  BankManagerConsoleApp

import Foundation

protocol Bankable: AnyObject {
    var waitingLine: Queue<Customer> { get set }
    var finishedCustomerCount: Int { get set }
    var depositQueue: DispatchQueue { get }
    var loanQueue: DispatchQueue { get }
    var depositSemaphore: DispatchSemaphore { get }
    var loanSemaphore: DispatchSemaphore { get }
    var customerCountSemaphore: DispatchSemaphore { get }
    var bankingServiceGroup: DispatchGroup { get }
    
    func allocateCustomer()
    func handleBankingService(_ customer: Customer)
}

extension Bankable {
    func addCustomer(_ customer: Customer) {
        self.waitingLine.enqueue(customer)
    }
    
    func resetFinishedCustomerCount() {
        self.finishedCustomerCount = 0
    }
}
