//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 우선순위 큐
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
    
    var processTiem: Double {
        switch self {
        case .loan:
            return 1.1
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

final class BankManager {
    private let clerkCount: Int = 3
    private let customerCount: Int = Int.random(in: 10...30)
    private let processTime: Double = 0.7
    
    private let totalTimeKey: DispatchSpecificKey<Double> = DispatchSpecificKey<Double>()
    private let processTimeKey: DispatchSpecificKey<Double> = DispatchSpecificKey<Double>()
    
    private lazy var clerks: [DispatchQueue] = {
        var clerks: [DispatchQueue] = []
        for index in 0..<clerkCount {
            let clerk = DispatchQueue(label: "\(index)")
            clerk.setSpecific(key: totalTimeKey, value: 0)
            clerk.setSpecific(key: processTimeKey, value: processTime)
            clerks.append(clerk)
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
    
    private var totalTimes: [Double] = []
    private var totalTimeCount: Double {
        get {
            guard let totalTime = totalTimes.max() else { return 0 }
            
            return totalTime
        }
    }
    
    func open() {
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let bankTaskGroup: DispatchGroup = DispatchGroup()
        
        for index in 0..<clerkCount {
            bankTaskGroup.enter()
            assignCustomer(customers.removeFirst(), to: clerks[index], group: bankTaskGroup)
            bankTaskGroup.notify(queue: clerks[index]) {
                semaphore.signal()
            }
        }
        
        for _ in 0..<clerkCount {
            semaphore.wait()
        }
        
        printCloseMessage()
    }
    
    private func assignCustomer(_ customer: Customer, to clerk: DispatchQueue, group: DispatchGroup) {
        clerk.async {
            let (currentTotalTime, processTime): (Double, Double) = self.getTimeInfo(clerk: clerk)
            let updatedTotalTime: Double = currentTotalTime + processTime
            
            print("\(customer.number)번 고객 업무 시작")
            self.sleep(processTime)
            clerk.setSpecific(key: self.totalTimeKey, value: updatedTotalTime)
            print("\(customer.number)번 고객 업무 완료")
            
            if self.customers.isEmpty {
                self.totalTimes.append(updatedTotalTime)
                group.leave()
            } else {
                self.assignCustomer(self.customers.removeFirst(), to: clerk, group: group)
            }
        }
    }

    private func getTimeInfo(clerk: DispatchQueue) -> (Double, Double) {
        guard let totalTime: Double = clerk.getSpecific(key: totalTimeKey),
              let processTime: Double = clerk.getSpecific(key: processTimeKey) else { fatalError() }
        
        return (totalTime, processTime)
    }
    
    private func sleep(_ time: Double) {
        let time: useconds_t = useconds_t(time * 1_000_000)
        usleep(time)
    }
    
    private func printCloseMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalTimeCount)초입니다.")
    }
}
