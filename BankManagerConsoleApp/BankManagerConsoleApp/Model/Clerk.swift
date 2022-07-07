//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/06/30.
//

import Foundation

struct Clerk {
    func provideService(_ client: Customer) {
        let business = client.business
        
        print("\(client.number)번 고객 \(business.serviceName)업무 시작")
        Thread.sleep(forTimeInterval: business.estimatedTime)
        
        print("\(client.number)번 고객 \(business.serviceName)업무 완료")
    }
}
