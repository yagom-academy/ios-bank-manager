//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/27.
//

import Foundation

struct Teller {
    let tellerNumber: Int = 1
    func processTask(for waitingNumber: Int) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        startTask(for: waitingNumber)
        waitForFinishingTask()
        finishTask(for: waitingNumber)
        let processedTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processedTime
    }
    
    func startTask(for waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 시작")
    }
    
    func waitForFinishingTask() {
        let processingTimePerTask: Double = 0.7
        
        RunLoop.current.run(until: Date().advanced(by: processingTimePerTask))
    }
    
    func finishTask(for waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 종료")
    }
}
