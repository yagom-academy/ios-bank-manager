//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//
import Foundation

struct Banker {
    private let taskTime: Double = 0.7
    
    func task(of customer: Customer) {
        guard let queueNumber = customer.queueNumber else {
            return
        }
        
        print("\(queueNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(queueNumber)번 고객 업무 종료")
        
    }
    
    func notifyTaskTime() -> Double {
        return taskTime
    }
}
