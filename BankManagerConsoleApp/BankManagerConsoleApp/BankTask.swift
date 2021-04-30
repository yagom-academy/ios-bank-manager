//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/04/30.
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
