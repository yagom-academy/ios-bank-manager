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
    private let loanBusinessQueue = DispatchQueue(label: "loanQueue", attributes: .concurrent)
    private let depositBusinessQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    private(set) var countOfCustomer: Int = 0
    private var totalProcessTime: TimeInterval = 0
    private let group = DispatchGroup()
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let depositSemaphore = DispatchSemaphore(value: 2)
    
    init(employee bankManager: BankManager, customer queue: CustomerQueue) {
        self.bankManager = bankManager
        self.queue = queue
    }
    
    mutating func start() throws {
        while true {
            displayMenu()
            let selectedMenu = selectMenu()
            
            switch selectedMenu {
            case NameSpace.one:
                updateCustomerQueue()
                handleCustomer()
                displayEndMessage()
            case NameSpace.two:
                return
            default:
                throw BankManagerError.Input
            }
        }
    }
    
    private func displayMenu() {
        print(NameSpace.startMessage, terminator: " ")
    }
    
    private mutating func selectMenu() -> String {
        guard let input = readLine() else {
            return ""
        }
    
       return input
    }
    
    private mutating func updateCustomerQueue() {
        countOfCustomer = Int.random(in: 10...30)
        let numberList = Array<Int>(1...countOfCustomer)
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
            putCustomerToSuitableQueue()
        }
        
        group.wait()
        totalProcessTime = CFAbsoluteTimeGetCurrent() - startTime
    }
    
    private func putCustomerToSuitableQueue() {
        while let customer = queue.dequeue() {
            let depositWorkItem = makeWorkItem(for: customer, by: depositSemaphore)
            let loanWorkItem = makeWorkItem(for: customer, by: loanSemaphore)
            
            switch customer.business {
            case .loan:
                loanBusinessQueue.async(group: group, execute: loanWorkItem)
            case .deposit:
                depositBusinessQueue.async(group: group, execute: depositWorkItem)
            }
        }
    }
    
    private func makeWorkItem(for customer: Customer, by semaphore: DispatchSemaphore) -> DispatchWorkItem {
        let workItem = DispatchWorkItem { [self] in
            semaphore.wait()
            bankManager.handle(customer: customer)
            semaphore.signal()
        }
        
        return workItem
    }
    
    private func displayEndMessage() {
        let totalHandlingTime = String(format: "%.2f", totalProcessTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(countOfCustomer)명이며, 총 업무시간은 \(totalHandlingTime)초입니다.")
    }
}
