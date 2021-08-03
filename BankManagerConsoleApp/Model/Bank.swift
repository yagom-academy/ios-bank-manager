//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    enum Status: Int {
        case open = 1
        case close = 2
    }
    
    enum Job: Int, CaseIterable, CustomStringConvertible {
        case loan = 1
        case deposit = 2
        
        var time: TimeInterval {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
        
        var clerkNumber: UInt8 {
            switch self {
            case .loan:
                return 1
            case .deposit:
                return 2
            }
        }
        
        var description: String {
            switch self {
            case .loan:
                return "대출"
            case .deposit:
                return "예금"
            }
        }
    }
    
    private var queue = Queue<Customer>()
    
    func receiveCustomer(range: ClosedRange<Int>) {
        for order in range {
            let randomNumber = Int.random(in: 1...Job.allCases.count)
            guard let randomJob = Job(rawValue: randomNumber) else {
                continue
            }
            queue.enqueue(value: Customer(id: order, requirement: randomJob))
        }
    }

    func doTask() {
        let bankConfigure = configure()

        var customer: Customer?
        let group = DispatchGroup()
        while !queue.isEmpty {
            group.enter()
            customer = queue.dequeue()
            let targetQueue = bankConfigure.filter { bankTaskQueue in
                return customer?.requirement == bankTaskQueue.identify
            }[0]
            
            targetQueue.matchingClerkWith(customer: customer) {
                group.leave()
            }
        }
        
        let _ = group.wait(timeout: .distantFuture)
        endTask(after: customer)
    }
    
    private func endTask(after customer: Customer?) {
        guard let customer = customer else {
            return
        }
        let finishTime = Double(customer.id) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer.id)명이며, 총 업무시간은 \(String(format: "%.2f", finishTime)) 입니다.")
    }
    
    private func configure() -> [BankTaskQueue] {
        return Job.allCases.map { job -> BankTaskQueue in
            let dispatchQueue = DispatchQueue(label: job.description, attributes: .concurrent)
            let dispatchSemaphore = DispatchSemaphore(value: Int(job.clerkNumber))
            let thisJobClerks = (1...job.clerkNumber).map { clerkNumber -> BankClerk in
                let id = job.rawValue * 100 + Int(clerkNumber)
                return BankClerk(id: id)
            }
            
            let bankTaskQueue = BankTaskQueue(
                identify: job,
                dispatchQueue: dispatchQueue,
                dispatchSemaphore: dispatchSemaphore,
                clerks: thisJobClerks
            )
            return bankTaskQueue
        }
    }
}
