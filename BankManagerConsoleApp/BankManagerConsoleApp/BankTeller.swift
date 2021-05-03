//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 김민성 on 2021/04/30.
//

import Foundation

struct Teller: Tellable {
    var tellerIndex: Int
    
    func conductService(_ client: inout Queue<Int>) {
        var processingTime: Double = 0
        var clientsCount: Int = 0
        
        while !client.isEmpty {
            guard let theFristClient = client.front else { return }

            announceServiceStart(theFristClient)
            usleep(700000)
            announceServiceFinish(theFristClient)
            
            client.dequeue()
            
            alertClosingAccount(of: clientsCount, in: processingTime)
            
            processingTime = sumOfficeHours(processingTime)
            clientsCount += 1
        }
    }
    
    private func alertClosingAccount(of clientsCount: Int, in processingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientsCount)명이며, 총 업무시간은 \(String(format: "%.1f", processingTime))초입니다.")
    }
    
    private func announceServiceStart(_ clientIndex: Int) {
        print("\(clientIndex)번 고객 업무 시작")
    }
    
    private func announceServiceFinish(_ clientIndex: Int) {
        print("\(clientIndex)번 고객 업무 완료")
    }
    
    private func sumOfficeHours(_ unitHour: Double) -> Double {
        return unitHour + 0.7
    }
}
