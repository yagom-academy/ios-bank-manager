//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

import Foundation

struct Bank: Agency {
    var banker2 = Banker(task: .loan)
    var banker1 = Banker(task: .deposit)
    var customerCount: Int?
    var ticketNumberQueue: Queue<BankCustomer> = {
        let randomNumber = Int.random(in: NameSpace.randomCustomerNumberRange)
        var randomCustomerQueue = Queue<BankCustomer>()
        
        for index in 1...randomNumber {
            randomCustomerQueue.enqueue(data: BankCustomer(task: Task.allCases.randomElement(), id: index))
        }
        
        return randomCustomerQueue
    }()
    
    var totalWorkTime: Double = 0
    
    let depositQueue = DispatchQueue.global()
    let loanQueue = DispatchQueue.global()
    
    let depositsemaphore = DispatchSemaphore(value: 2)
    let loansemaphore = DispatchSemaphore(value: 1)
    let group = DispatchGroup()
    
    mutating func open() {
        customerCount = ticketNumberQueue.count
        
        while let currentCustomer = ticketNumberQueue.dequeue() {
            if currentCustomer.task == .deposit {
                group.enter()
                depositQueue.async { [self] in
                    depositsemaphore.wait()
                    banker1.startWork(of: currentCustomer)
                    depositsemaphore.signal()
                    group.leave()
                }
            } else if currentCustomer.task == .loan {
                group.enter()
                loanQueue.async { [self] in
                    loansemaphore.wait()
                    banker2.startWork(of: currentCustomer)
                    loansemaphore.signal()
                    group.leave()
                }
            }
        }
        group.wait()
    }
    
    mutating func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount ?? 0)명이며, 총 업무시간은 \(totalWorkTime.formatDoubleToString())초입니다.")
    }
}
