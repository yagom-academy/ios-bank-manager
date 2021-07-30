//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

class Bank {
    var numberOfBankTellers: Int = .zero
    var bankTellerQueue = Queue<BankTeller>()
    var customerQueue = Queue<Customer>()
    var totalNumberOfVisitors: UInt = .zero
    
    func reset() {
        numberOfBankTellers = .zero
        bankTellerQueue.clear()
        customerQueue.clear()
        totalNumberOfVisitors = .zero
    }
    
    func takeNumberTicket() -> UInt {
        totalNumberOfVisitors += 1
        return totalNumberOfVisitors
    }
    
    func hire(employees: [BankTeller]) {
        numberOfBankTellers = employees.count
        employees.forEach { bankTellerQueue.enqueue($0) }
    }
    
    func receive(customers: [Customer]) {
        customers.forEach { customerQueue.enqueue($0) }
    }
    
    func serveCustomers() {
        let semaphore = DispatchSemaphore(value: numberOfBankTellers)
        while let currentCustomer = customerQueue.dequeue() {
            semaphore.wait()
            guard let bankTeller = bankTellerQueue.dequeue() else {
                customerQueue.enqueue(currentCustomer)
                semaphore.signal()
                continue
            }
            DispatchQueue.global().async {
                bankTeller.serve(customer: currentCustomer)
                self.bankTellerQueue.enqueue(bankTeller)
                semaphore.signal()
            }
        }
    }
}
