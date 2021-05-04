//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.


import Foundation

class BankTask: Operation {
    
    private var taskType: BankTaskType
    private var taskTime: Double
    private var waitingNumber: Int
    private var customerGrade: CustomerGrade
    
    init(waitingNumber: Int, grade: CustomerGrade) {
        self.taskType = BankTaskType.random
        self.taskTime = taskType.taskTime
        self.waitingNumber = waitingNumber
        self.customerGrade = grade
        super.init()
        super.queuePriority = customerGrade.queuePriority
    }
    
    override func main() {
        print("🔴\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        
        if taskType.name == "대출" {
            headOfficeJob(headTask: HeadOfficeBankTask(waitingNumber: waitingNumber, customerGrade: customerGrade.name), judgeQueue: BankManager.headOfficeQueue)
        }
        
        print("🔵\(waitingNumber)번 \(customerGrade.name)고객 \(taskType.name)업무 완료")
    }

    func headOfficeJob(headTask: HeadOfficeBankTask, judgeQueue: OperationQueue) {
        
        var array: [HeadOfficeBankTask] = []
        array.append(headTask)
        judgeQueue.maxConcurrentOperationCount = 1
        judgeQueue.addOperations(array, waitUntilFinished: true)
        Thread.sleep(forTimeInterval: taskTime)
        
    }
}
