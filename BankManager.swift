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
            return 0.7
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
        print("\(customer.number)번 고객 업무 시작")
        self.sleep(customer.task.processTime)
        print("\(customer.number)번 고객 업무 완료")
    }
    
    private func sleep(_ time: Double) {
        let time: useconds_t = useconds_t(time * 1_000_000)
        usleep(time)
    }
}

final class BankManager {
    private let clerkCount: Int = 1
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
    private lazy var customers: [Customer] = {
        var customers: [Customer] = []
        for index in 1...customerCount {
            if let level = Level.allCases.randomElement(),
               let task = Task.allCases.randomElement() {
                
                customers.append(Customer(number: index, level: level, task: task))
            }
        }
        
        return customers
    }()
    private lazy var totalTimes: [Double] = [Double](repeating: 0, count: clerkCount)
    
    func open() {
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let bankTaskGroup: DispatchGroup = DispatchGroup()
        
        for index in 0..<clerkCount {
            bankTaskGroup.enter()
            assignCustomer(customers.removeFirst(), to: clerks[index], group: bankTaskGroup)
            bankTaskGroup.notify(queue: clerks[index].queue) {
                semaphore.signal()
            }
        }
        
        for _ in 0..<clerkCount {
            semaphore.wait()
        }
        
        printCloseMessage()
    }
    
    private func assignCustomer(_ customer: Customer, to clerk: Clerk, group: DispatchGroup) {
        clerk.queue.async {
            clerk.doTask(customer: customer)
            
            if self.customers.isEmpty {
                group.leave()
            } else {
                self.assignCustomer(self.customers.removeFirst(), to: clerk, group: group)
            }
        }
        
        self.totalTimes[clerk.number] += customer.task.processTime
    }
    
    private func printCloseMessage() {
        print(String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다.", customerCount, totalTime))
    }
}
