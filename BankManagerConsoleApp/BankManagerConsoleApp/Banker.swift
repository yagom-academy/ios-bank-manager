//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//
import Foundation

struct Banker {
    private let serviceTime: Double = 0.7
    
    mutating func task(_ customer: Customer) -> Double? {
        guard let queueNumber = customer.queueNumber else {
            return nil
        }
        
        print("\(queueNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: serviceTime)
        print("\(queueNumber)번 고객 업무 종료")
        
        return serviceTime
    }
}
