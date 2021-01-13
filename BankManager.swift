//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let clerkCount: Int = 3
    private let customerCount: Int = Int.random(in: 10...30)
    private var totalTime: Double {
        get {
            guard let totalTime = totalTimes.max() else { return 0 }
            
            return totalTime
        }
    }

    private lazy var clerks: [Clerk] = {
        var clerks: [Clerk] = []
        for index in 0..<clerkCount {
            clerks.append(Clerk(index))
        }
        
        return clerks
    }()
    private lazy var customers: PriorityQueue<Customer> = {
        var customers: PriorityQueue<Customer> = PriorityQueue(
            sort: { $0.level.priority < $1.level.priority },
            elements: []
        )
        
        for index in 1...customerCount {
            if let level = Level.allCases.randomElement(),
               let task = Task.allCases.randomElement() {
                
                customers.enqueue(Customer(number: index, level: level, task: task))
            }
        }
        
        return customers
    }()
    private lazy var totalTimes: [Double] = [Double](repeating: 0, count: clerkCount)
    
    func open() {
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let bankTaskGroup: DispatchGroup = DispatchGroup()
        
        var workingClerkCount: Int = 0
        for index in 0..<clerkCount {
            bankTaskGroup.enter()
            guard let customer = customers.dequeue() else { break }
            assignCustomer(customer, to: clerks[index], group: bankTaskGroup)
            workingClerkCount += 1
            bankTaskGroup.notify(queue: clerks[index].queue) {
                semaphore.signal()
            }
        }
        
        for _ in 0..<workingClerkCount {
            semaphore.wait()
        }
        
        printCloseMessage()
    }
    
    private func assignCustomer(_ customer: Customer, to clerk: Clerk, group: DispatchGroup) {
        clerk.queue.async {
            clerk.doTask(customer: customer)
            
            if let customer = self.customers.dequeue() {
                self.assignCustomer(customer, to: clerk, group: group)
            } else {
                group.leave()
            }
        }
        
        self.totalTimes[clerk.number] += customer.task.processTime
    }
    
    private func printCloseMessage() {
        print(String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다.", customerCount, totalTime))
    }
}
