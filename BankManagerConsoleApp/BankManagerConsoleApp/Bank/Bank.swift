//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

import Foundation

struct Bank {
    private var customers = Queue<Customer>()
    private let depositQueue = OperationQueue()
    private let loanQueue = OperationQueue()
    private let totalCustomerCount: Int
    private var totalTaskTime: CFAbsoluteTime = 0
    
    init() {
        totalCustomerCount = Int.random(in: 10...30)
        (1...totalCustomerCount).forEach {
            customers.enqueue(Customer(numberTicket: $0))
        }
    }
    
    mutating func start() {
        assignClerk()
        totalTaskTime = measureTime {
            distributeCustomers()
        }
        announceResult()
    }
    
    private func assignClerk() {
        depositQueue.assignBankClerkCount(ClerkCount.deposit)
        loanQueue.assignBankClerkCount(ClerkCount.loan)
    }
    
    private func measureTime(perform: () -> Void) -> CFAbsoluteTime {
        let start = CFAbsoluteTimeGetCurrent()
        perform()
        let end = CFAbsoluteTimeGetCurrent()
        
        return end - start
    }
    
    private mutating func distributeCustomers() {
        while let customer = customers.dequeue() {
            switch customer.task {
            case .deposit:
                depositQueue.addOperation(work(customer: customer))
            case .loan:
                loanQueue.addOperation(work(customer: customer))
            }
        }
        
        depositQueue.waitUntilAllOperationsAreFinished()
        loanQueue.waitUntilAllOperationsAreFinished()
    }
    
    private func work(customer: Customer) -> BlockOperation {
        return BlockOperation {
            print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 시작")
            Thread.sleep(forTimeInterval: customer.task.information.time)
            print("\(customer.numberTicket)번 고객 \(customer.task.information.title)업무 완료")
        }
    }
    
    private func announceResult() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초 입니다.")
    }
}

//MARK: - Bank Task Extension
extension Bank {
    enum Task {
        case loan
        case deposit
        
        static var random: Self {
            return Int.random(in: 1...2) % 2 == 1 ? .loan : .deposit
        }
        
        var information: (title: String, time: Double) {
            switch self {
            case .deposit:
                return (TaskTitle.deposit, TaskTime.deposit)
            case .loan:
                return (TaskTitle.loan, TaskTime.loan)
            }
        }
    }
}

//MARK: - Namespace Extension
private extension Bank {
    enum ClerkCount {
        static let deposit = 2
        static let loan = 1
    }
    
    enum TaskTitle {
        static let deposit = "예금"
        static let loan = "대출"
    }
    
    enum TaskTime {
        static let deposit = 0.7
        static let loan = 1.1
    }
}

//MARK: - OperationQueue Extension
private extension OperationQueue  {
    func assignBankClerkCount(_ count: Int) {
        self.maxConcurrentOperationCount = count
    }
}
