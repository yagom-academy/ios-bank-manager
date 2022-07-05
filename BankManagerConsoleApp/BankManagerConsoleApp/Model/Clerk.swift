//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/06/30.
//

import Foundation

struct Clerk {
    func provideService(_ client: Client) -> Double {
        print("\(client.number)번 고객 업무 시작")
        
        switch client.business {
        case .deposit:
            Thread.sleep(forTimeInterval: EstimatedTime.deposit)
            print("\(client.number)번 고객 업무 종료")
            return EstimatedTime.deposit
        case .loan:
            Thread.sleep(forTimeInterval: EstimatedTime.loan)
            print("\(client.number)번 고객 업무 종료")
            return EstimatedTime.loan
        }
    }
}
