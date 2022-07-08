//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

import Foundation

struct Bank: Agency {
    let depositQueue = DispatchQueue.global()
    var depositBanker = Banker(task: .deposit)
    let depositSemaphore: DispatchSemaphore
    
    let loanQueue = DispatchQueue.global()
    var loanBanker = Banker(task: .loan)
    let loanSemaphore: DispatchSemaphore
    
    let group = DispatchGroup()
    
    var totalWorkTime: Double = 0
    var customerCount: Int?
    
    var ticketNumberQueue: Queue<BankCustomer> = {
        let randomNumber = Int.random(in: WaitingNumber.randomCustomerNumberRange)
        var randomCustomerQueue = Queue<BankCustomer>()
        
        for index in 1...randomNumber {
            randomCustomerQueue.enqueue(data: BankCustomer(task: Task.allCases.randomElement(), id: index))
        }
        
        return randomCustomerQueue
    }()
    
    init(numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
        self.depositSemaphore = DispatchSemaphore(value: numberOfDepositBankers)
        self.loanSemaphore = DispatchSemaphore(value: numberOfLoanBankers)
    }
    
    mutating func open() {
        customerCount = ticketNumberQueue.count
        while let currentCustomer = ticketNumberQueue.dequeue() {
            switch currentCustomer.task {
            case .deposit:
                matchWork(to: depositBanker, with: currentCustomer, queue: depositQueue, semaphore: depositSemaphore)
                depositBanker.workTime += Task.deposit.workTime
            case .loan:
                matchWork(to: loanBanker, with: currentCustomer, queue: loanQueue, semaphore: loanSemaphore)
                loanBanker.workTime += Task.loan.workTime
            case .none:
                break
            }
        }
        group.wait()
    }
    
    func matchWork(to banker: Banker, with currentCustomer: BankCustomer, queue: DispatchQueue, semaphore: DispatchSemaphore) {
        group.enter()
        queue.async {
            semaphore.wait()
            banker.startWork(of: currentCustomer)
            semaphore.signal()
            group.leave()
        }
    }
    
    mutating func close() {
        self.checkTotalTime()
        print(BankTask.closeBank + BankTask.processedCustomerTotalNumber + "\(customerCount ?? 0)" + BankTask.totalWorkTime + "\(totalWorkTime.formatDoubleToString())" + BankTask.finishOutput)
    }
    
    mutating func checkTotalTime() {
        self.totalWorkTime += loanBanker.workTime
        self.totalWorkTime += depositBanker.workTime
    }
}
