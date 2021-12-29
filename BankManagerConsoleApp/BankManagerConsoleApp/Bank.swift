//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/23.
//

import Foundation

struct Bank {
    
    private var customerQueue: CustomerQueue<Customer>
    private var numberOfCustomer: Int
    private var clerks: BankClerk
    private let taskGroup: DispatchGroup
    
    private var numberOfCustomerRange: ClosedRange<Int> {
        return 1...numberOfCustomer
    }
    
    init(numberOfCustomerRange: ClosedRange<Int> = DefaultValue.numberOfCustomerRange) {
        self.customerQueue = CustomerQueue()
        self.numberOfCustomer = Int.random(in: numberOfCustomerRange)
        self.clerks = BankClerk(depositClerkCount: 2, loanClerkCount: 1)
        self.taskGroup = DispatchGroup()
    }
    
    mutating func open() {
        enqueueCustomer()
        let startTime = Date()
        operateTask()
        let totalTime = checkTotalTime(from: startTime)
        printTaskEndMessage(time: totalTime)
        resetBank()
    }
    
    private func enqueueCustomer() {
        for count in numberOfCustomerRange {
            let customer = Customer(turn: count)
            customerQueue.enqueue(data: customer)
        }
    }
    
    private func checkTotalTime(from startTime: Date) -> String {
        let totalTime = abs(startTime.timeIntervalSinceNow)
        let timeDescription = String(format: "%.2f", totalTime)
        return timeDescription
    }
    
    private mutating func operateTask() {
        for _ in numberOfCustomerRange {
            takeTask()
        }
        taskGroup.wait()
    }
    
    private mutating func takeTask() {
        do {
            let customer = try customerQueue.dequeue()
            enqueueTask(of: customer)
        } catch LinkedListError.dataDoesNotExist {
            print(LinkedListError.dataDoesNotExist.description)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private mutating func enqueueTask(of customer: Customer) {
        let clerk = clerks.assignClerk(of: customer.task)
        clerk.async(group: taskGroup) { [self] in
            self.task(of: customer)
        }
    }
    
    private func task(of customer: Customer) {
        let number = customer.turn
        let task = customer.task.koreanDescription
        print(Message.taskStart(turn: number, service: task).description)
        Thread.sleep(forTimeInterval: customer.task.processingTime)
        print(Message.taskEnd(turn: number, service: task).description)
    }
    
    private func printTaskEndMessage(time: String) {
        print(Message.totalTaskEnd(count: numberOfCustomer, time: time).description)
    }
    
    private mutating func resetBank() {
        numberOfCustomer = Int.random(in: DefaultValue.numberOfCustomerRange)
        customerQueue.clear()
    }
    
}

private extension Bank {
    
    enum Message {
        case taskStart(turn: Int, service: String)
        case taskEnd(turn: Int, service: String)
        case totalTaskEnd(count: Int, time: String)
        
        var description: String {
            switch self {
            case .taskStart(let turn, let service):
                return "\(turn)번 고객 \(service)업무 시작"
            case .taskEnd(let turn, let service):
                return "\(turn)번 고객 \(service)업무 완료"
            case .totalTaskEnd(let count, let time):
                return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(time)초입니다."
            }
        }
    }
    
    struct DefaultValue {
        static let numberOfCustomerRange = 10...30
    }
    
}
