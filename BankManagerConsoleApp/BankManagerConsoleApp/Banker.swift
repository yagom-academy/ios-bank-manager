//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//
import Foundation

struct Banker {
    private let workTime: Double = 0.7
    
    func work(of customer: Customer) {
        guard let queueNumber = customer.queueNumber else {
            return
        }
        
        print("\(queueNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: workTime)
        print("\(queueNumber)번 고객 업무 종료")
        
    }
    
    func notifyWorkTime() -> Double {
        return workTime
    }
}
