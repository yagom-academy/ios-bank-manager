//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

class BankTaskOperation: Operation {
    let waitingNumber: Int
    let taskTime: Double
    
    init(_ clientNumber: Int, _ taskTime: Double) {
        self.waitingNumber = clientNumber
        self.taskTime = taskTime
    }
    
    override func main() {
        print("\(waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(waitingNumber)번 고객 업무 완료")
    }
}
