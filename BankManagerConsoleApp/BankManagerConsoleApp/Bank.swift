//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

final class Bank {
    private let userInteraction = UserInteraction()
    private let customerQueue = BankManagerQueue<Customer>()
    private var customers = Int.zero
    private var bankers = [Banker]()
    
    
     func addBanker(howMany: Int, type: BusinessType) {
        guard howMany != 0 else {
            return
        }
        
        for _ in 1...howMany {
            bankers.append(Banker(type: type))
        }
    }
    
     func startTask() {
        while true {
            userInteraction.selectMode()
            guard userInteraction.isBankOpen() else { return }
            generateTodayCustomers()
            insertCustomerQueue(of: customers)
            let depositSemaphore = DispatchSemaphore(value: 2)
            let loanSemephore = DispatchSemaphore(value: 1)
            let group = DispatchGroup()
            
             while let customer = customerQueue.dequeue() {
                var department = bankers.filter {
                    $0.type == customer.business
                }
                let banker = department.removeFirst()

                DispatchQueue.global().async(group: group) {
                    if customer.business == .deposit {
                        depositSemaphore.wait()
                    } else {
                        loanSemephore.wait()
                    }
                    
                    banker.doBusiness(customer: customer)
                    self.bankers.append(banker)
                   
                    if customer.business == .deposit {
                        depositSemaphore.signal()
                    } else {
                        loanSemephore.signal()
                    }
                }
            }
            group.wait()
        }
    }
    
    private func insertCustomerQueue(of totalCustomers: Int) {
        for sequence in CustomerNumber.firstCustomer...totalCustomers {
            guard let randomCusotomerBusinessType = BusinessType.allCases.randomElement() else { return }
            let currentCustomer = Customer(numberTicket: sequence, business: randomCusotomerBusinessType)
            customerQueue.enqueue(data: currentCustomer)
        }
    }
    
    private func generateTodayCustomers() {
        customers = Int.random(in: CustomerNumber.minimumCustomer..<CustomerNumber.maximumCustomer)
    }
}
