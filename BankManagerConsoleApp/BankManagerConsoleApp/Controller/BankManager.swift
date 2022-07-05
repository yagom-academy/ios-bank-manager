//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let clerk: Clerk
    private var customers: CustomerQueue<Customer>
    
    private let customerGroup = DispatchGroup()
    private let depositSemaphore = DispatchSemaphore(value: NumberOfClerks.deposit)
    private let loanSemaphore = DispatchSemaphore(value: NumberOfClerks.loan)
    
    init(clerk: Clerk = Clerk(),
         customers: CustomerQueue<Customer> = CustomerQueue<Customer>()) {
        self.clerk = clerk
        self.customers = customers
    }
    
    func openBank() {
        print("\(Selections.run) : 은행개점\n\(Selections.dismiss) : 종료")
        print("입력 :", terminator: " ")
        let selection = readLine()
        
        switch selection {
        case Selections.run:
            issueTickets()
            return
        case Selections.dismiss:
            return
        default:
            openBank()
            return
        }
    }
    
    private func issueTickets() {
        let numberOfCustomers = Int.random(
            in: NumberOfCustomers.minimum...NumberOfCustomers.maximum
        )
        
        let tickets = Array(1...numberOfCustomers)
        tickets.forEach {
            if let business = Service.allCases.randomElement() {
                customers.enqueue(Customer(number: $0, business: business))
            }
        }
        
        startWork()
        return
    }
    
    private func startWork() {
        var servedCustomers = 0
        var elapsedTime = 0.0
        
        while let customer = customers.dequeue() {
            servedCustomers += 1
            
            DispatchQueue.global().async(group: customerGroup) {
                switch customer.business {
                case .deposit:
                    self.depositSemaphore.wait()
                    elapsedTime += self.clerk.provideService(customer)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    elapsedTime += self.clerk.provideService(customer)
                    self.loanSemaphore.signal()
                }
            }
        }
        
        customerGroup.wait()
        finishWork(customers: servedCustomers, time: elapsedTime)
        openBank()
        return
    }
    
    private func finishWork(customers: Int, time: Double) {
        let formattedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
