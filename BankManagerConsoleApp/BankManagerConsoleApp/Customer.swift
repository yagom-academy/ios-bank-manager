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

class Customer {
    
    private var _bankTask: BankTask
    private var waitingNumber: Int
    var bankTask: BankTask {
        return _bankTask
    }
    
    init(waitingNumber: Int) {
        self._bankTask = BankTask(taskTime: 0.7, waitingNumber)
        self.waitingNumber = waitingNumber
    }
    
}
