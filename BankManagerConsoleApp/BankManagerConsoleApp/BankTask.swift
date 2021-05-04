//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

class BankTaskOperation: Operation {
    let waitingNumber: Int
    private let taskTime: Double = 0.7
    
    init(_ waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
    
    override func main() {
        print("\(waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(waitingNumber)번 고객 업무 완료")
    }
    
    func getTaskTime() -> Double {
        return taskTime
    }
}
