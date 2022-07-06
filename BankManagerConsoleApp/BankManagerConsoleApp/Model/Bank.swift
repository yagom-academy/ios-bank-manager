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
    let loanQueue = DispatchQueue(label: "loanQueue")
    let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    private(set) var randomNumberOfCustomer: Int = 0
    let group = DispatchGroup()
    let depositSemaphore = DispatchSemaphore(value: 2)
    var totalTime: TimeInterval = 0
    
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
        for _ in 0..<queue.count {
            while let customer = queue.dequeue() {
                let workItem = DispatchWorkItem { [self] in
                    group.enter()
                    depositSemaphore.wait()
                    bankManager.handle(customer: customer)
                    group.leave()
                    depositSemaphore.signal()
                }
                
                if customer.business == .loan {
                    loanQueue.async(group: group, execute: workItem)
                } else {
                    depositQueue.async(group: group, execute: workItem)
                }
            }
        }
    }
    
    private func displayEndMessage() {
        let totalHandlingTime = String(format: "%.2f",totalTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomNumberOfCustomer)명이며, 총 업무시간은 \(totalHandlingTime)초입니다.")
    }
}
