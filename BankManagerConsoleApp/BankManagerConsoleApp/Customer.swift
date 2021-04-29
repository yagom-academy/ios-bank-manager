//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

enum TaskType: CaseIterable {
    case deposit
    case load
    
    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .load:
            return 1.1
        }
    }
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .load:
            return "대출"
        }
    }
    
    static var random: TaskType {
        guard let randomTaskType = TaskType.allCases.randomElement() else {
            return TaskType.deposit
        }
        return randomTaskType
    }
}

class BankTask: Operation {
    
    private var taskType: TaskType
    private var taskTime: Double
    private var waitingNumber: Int
    private var customerGrade: CustomerGrade
    
    init(_ waitingNumber: Int, _ grade: CustomerGrade) {
        self.taskType = TaskType.random
        self.taskTime = taskType.taskTime
        self.waitingNumber = waitingNumber
        self.customerGrade = grade
        super.init()
        super.queuePriority = customerGrade.queuePriority
    }
    
    override func main() {
        print("🔴\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 시작", super.queuePriority.rawValue)
        Thread.sleep(forTimeInterval: taskTime)
        print("🔵\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 완료")
    }
    
}

enum CustomerGrade: CaseIterable {
    case vvip
    case vip
    case basic
    
    var name: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .basic:
            return "일반"
        }
    }
    
    var queuePriority: Operation.QueuePriority {
        switch self {
        case .vvip:
            return Operation.QueuePriority.veryHigh
        case .vip:
            return Operation.QueuePriority.normal
        case .basic:
            return Operation.QueuePriority.veryLow
        }
    }
    
    static var random: CustomerGrade {
        guard let randomGrade = CustomerGrade.allCases.randomElement() else {
            return CustomerGrade.basic
        }
        return randomGrade
    }
}

struct Customer {
    
    private var grade: CustomerGrade
    private var _bankTask: BankTask
    private var waitingNumber: Int
    var bankTask: BankTask {
        return _bankTask
    }
    
    init(waitingNumber: Int) {
        self.grade = CustomerGrade.random
        self._bankTask = BankTask(waitingNumber, grade)
        self.waitingNumber = waitingNumber
    }
    
}
