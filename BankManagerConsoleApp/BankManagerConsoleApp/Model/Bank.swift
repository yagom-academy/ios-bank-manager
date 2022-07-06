//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/01.
//

import Foundation

struct Bank {
    private var bankManager: BankManager
    private var queue: CustomerQueue
    let loanQueue = DispatchQueue(label: "loanQueue", attributes: .concurrent)
    let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    private(set) var randomNumberOfCustomer: Int = 0
    let group = DispatchGroup()
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)

    var totalProcessTime: TimeInterval = 0
    
    init(employee bankManager: BankManager, customer queue: CustomerQueue) {
        self.bankManager = bankManager
        self.queue = queue
    }
    
    mutating func start() throws {
        while true {
            displayMenu()
            let selectedMenu = selectMenu()
            
            if selectedMenu == NameSpace.one.print {
                updateCustomerQueue()
                handleCustomer()
                displayEndMessage()
            } else if selectedMenu == NameSpace.two.print {
                break
            } else {
                throw BankManagerError.Input
            }
        }
    }
    
    private func displayMenu() {
        print(NameSpace.startMessage.print, terminator: " ")
    }
    
    private mutating func selectMenu() -> String {
        guard let input = readLine() else {
            return ""
        }
    
       return input
    }
    
    private mutating func updateCustomerQueue() {
        randomNumberOfCustomer = Int.random(in: 10...30)
        let numberList = Array<Int>(1...randomNumberOfCustomer)
        let businessList = [Business.loan, Business.deposit]
        
        numberList.forEach {
            let randomNumber = Int.random(in: 0...1)
            let customer = Customer(number: $0, business: businessList[randomNumber])
            
            queue.enqueue(data: customer)
        }
    }
    
    private mutating func handleCustomer() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        for _ in 0..<queue.count {
            while let customer = queue.dequeue() {
                let depositWorkItem = DispatchWorkItem { [self] in
                    group.enter()
                    depositSemaphore.wait()
                    bankManager.handle(customer: customer)
                    group.leave()
                    depositSemaphore.signal()
                }
                
                let loanWorkItem = DispatchWorkItem { [self] in
                    group.enter()
                    loanSemaphore.wait()
                    bankManager.handle(customer: customer)
                    group.leave()
                    loanSemaphore.signal()
                }
                
                if customer.business == .loan {
                    loanQueue.async(group: group, execute: loanWorkItem)
                } else {
                    depositQueue.async(group: group, execute: depositWorkItem)
                }
            }
        }
        group.wait()
        totalProcessTime = CFAbsoluteTimeGetCurrent() - startTime
    }
    
    private func displayEndMessage() {
        let totalHandlingTime = String(format: "%.2f", totalProcessTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomNumberOfCustomer)명이며, 총 업무시간은 \(totalHandlingTime)초입니다.")
    }
}
