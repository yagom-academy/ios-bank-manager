//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

class BankTaskOperation: Operation {
    let clientNumber: Int
    let taskTime: Double
    
    init(_ clientNumber: Int, _ taskTime: Double) {
        self.clientNumber = clientNumber
        self.taskTime = taskTime
    }
    
    override func main() {
        print("\(clientNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(clientNumber)번 고객 업무 완료")
    }
}
