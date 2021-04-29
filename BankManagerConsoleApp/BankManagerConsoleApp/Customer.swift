//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

class BankTask: Operation {
    
    private var taskTime: Double
    private var waitingNumber: Int
    
    init(taskTime: Double, _ waitingNumber: Int) {
        self.taskTime = taskTime
        self.waitingNumber = waitingNumber
    }
    
    override func main() {
        print(waitingNumber, "번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print(waitingNumber, "번 고객 업무 완료")
    }
    
}

enum CustomerGrade: CaseIterable {
    case vvip
    case vip
    case basic
    
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
        self._bankTask = BankTask(taskTime: 0.7, waitingNumber)
        self.waitingNumber = waitingNumber
        self.grade = CustomerGrade.random
    }
    
}
