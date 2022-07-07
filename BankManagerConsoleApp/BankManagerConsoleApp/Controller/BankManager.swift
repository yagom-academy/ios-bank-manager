//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    func openBank() {
        while true {
            print("\(Selections.run) : 은행개점\n\(Selections.dismiss) : 종료")
            print("입력 :", terminator: " ")
            let selection = readLine()
            
            switch selection {
            case Selections.run:
                issueTickets()
            case Selections.dismiss:
                return
            default:
                continue
            }
        }
    }
    
    private func issueTickets() {
        var customersQueue = QueueWithLinkedList<Customer>()
        
        let numberOfCustomers = Int.random(
            in: NumberOfCustomers.minimum...NumberOfCustomers.maximum
        )
        
        let customers = (1...numberOfCustomers).compactMap { number -> Customer? in
            if let business = Service.allCases.randomElement() {
                let customer = Customer(number: number, business: business)
                return customer
            }
            
            return nil
        }
        
        for customer in customers {
            customersQueue.enqueue(customer)
        }
        
        startWork(with: customersQueue)
        return
    }
    
    private func startWork(with customersQueue: QueueWithLinkedList<Customer>) {
        let customerGroup = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: NumberOfClerks.deposit)
        let loanSemaphore = DispatchSemaphore(value: NumberOfClerks.loan)
        
        var servedCustomers = 0
        var customers = customersQueue
        
        let start = DispatchTime.now()
        
        while let customer = customers.dequeue() {
            servedCustomers += 1
            
            DispatchQueue.global().async(group: customerGroup) {
                switch customer.business {
                case .deposit:
                    depositSemaphore.wait()
                    Clerk.provideService(customer)
                    depositSemaphore.signal()
                case .loan:
                    loanSemaphore.wait()
                    Clerk.provideService(customer)
                    loanSemaphore.signal()
                }
            }
        }
        
        customerGroup.wait()
        
        let end = DispatchTime.now()
        let elapsedTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1000000000
        
        showResult(servedCustomers: servedCustomers, elapsedTime: elapsedTime)
        return
    }
    
    private func showResult(servedCustomers: Int, elapsedTime: Double) {
        let formattedTime = String(format: "%.2f", elapsedTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(servedCustomers)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
