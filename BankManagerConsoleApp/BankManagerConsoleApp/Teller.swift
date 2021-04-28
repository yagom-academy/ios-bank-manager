//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/27.
//

import Foundation

struct Teller {
    let tellerNumber: Int = 1
    
    func processTask(for waitingNumber: Int) {
        startTask(for: waitingNumber)
        waitForFinishingTask()
        finishTask(for: waitingNumber)
    }
    
    func startTask(for waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 시작")
    }
    
    func waitForFinishingTask() {
        let processingTimePerTask: Double = 0.7
        sleep(UInt32(processingTimePerTask))
    }
    
    func finishTask(for waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 종료")
    }
}
