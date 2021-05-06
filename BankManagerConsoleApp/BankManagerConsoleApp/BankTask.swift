//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.


import Foundation

class BankTask: Operation {
    
    private var taskType: BankTaskType
    private var waitingNumber: Int
    private var customerGrade: CustomerGrade
    
    init(waitingNumber: Int, grade: CustomerGrade) {
        self.taskType = BankTaskType.random
        self.waitingNumber = waitingNumber
        self.customerGrade = grade
        super.init()
        super.queuePriority = customerGrade.queuePriority
    }
    
    override func main() {
        print("🔴\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 시작")
        Thread.sleep(forTimeInterval: taskType.taskTime)
        if taskType == .loan {
            NotificationCenter.default.post(name: Notification.Name("HeadOffice"), object: nil, userInfo: ["waitingNumber": waitingNumber, "customerGrade": customerGrade])
            Thread.sleep(forTimeInterval: taskType.taskTime)
        }
        print("🔵\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 완료")
    }
    
}
