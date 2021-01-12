//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Level: CaseIterable {
    case vvip, vip, general
    
    var priority: Int {
        switch self {
        case .vvip:
            return 0
        case .vip:
            return 1
        case .general:
            return 2
        }
    }
    
    var description: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .general:
            return "일반"
        }
    }
}

enum Task: CaseIterable {
    case loan, deposit
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    var processTime: Double {
        switch self {
        case .loan:
            return 0.7
        case .deposit:
            return 1.1
        }
    }
}

struct Customer {
    var number: Int
    var level: Level
    var task: Task
}

struct Clerk {
    var number: Int
    var queue: DispatchQueue
    
    init(_ index: Int) {
        number = index
        queue = DispatchQueue(label: "\(index)")
    }
    
    func doTask(customer: Customer) {
        print("\(customer.number)번 \(customer.level.description)고객 \(customer.task.description)업무 시작")
        self.sleep(customer.task.processTime)
        print("\(customer.number)번 \(customer.level.description)고객 \(customer.task.description)업무 완료")
    }
    
    private func sleep(_ time: Double) {
        let time: useconds_t = useconds_t(time * 1_000_000)
        usleep(time)
    }
    
    private func requestLoanJudgement() {
        //HeadOffice.
    }
}

final class HeadOffice {
    static let shared: HeadOffice = HeadOffice()
    static var currentTime: Double = 0
    static let timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
        print("Timer \(currentTime)")
        currentTime += 0.1
    }
    static let queue: DispatchQueue = DispatchQueue(label: "headOffice")
}

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
        var customers: [Customer] = []
        for index in 1...customerCount {
            if let level = Level.allCases.randomElement(),
               let task = Task.allCases.randomElement() {
                
                customers.append(Customer(number: index, level: level, task: task))
            }
        }
        
        return PriorityQueue(
            sort: { $0.level.priority < $1.level.priority },
            elements: customers
        )
    }()
    private lazy var totalTimes: [Double] = [Double](repeating: 0, count: clerkCount)
    
    func open() {
        HeadOffice.timer.fire()
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
