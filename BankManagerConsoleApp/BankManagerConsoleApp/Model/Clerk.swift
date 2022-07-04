//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/06/30.
//

import Foundation

struct Clerk {
    func provideService(_ client: Client) {
        print("\(client.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: EstimatedTime.deposit)
        print("\(client.number)번 고객 업무 종료")
    }
}
