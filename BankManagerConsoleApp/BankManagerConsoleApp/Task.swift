//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

class Task: Operation {
    var waitingNumber: Int
    var grade: CustomerPriority
    var visitPurpose: TaskType
    
    init(waitingNumber: Int, grade: CustomerPriority) {
        self.waitingNumber = waitingNumber
        self.grade = grade
        self.visitPurpose = TaskType.random
        super.init()
        super.queuePriority = grade.queuePriority
    }
    
    override func main() {
        print("\(waitingNumber)번 \(grade.tier)고객 \(visitPurpose.purpose)업무 시작")
        Thread.sleep(forTimeInterval: visitPurpose.taskTime)
        print("\(waitingNumber)번 \(grade.tier)고객 \(visitPurpose.purpose)업무 완료")
    }
}
