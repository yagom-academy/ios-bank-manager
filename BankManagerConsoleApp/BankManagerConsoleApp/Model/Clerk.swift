//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by 변재은 on 2022/06/30.
//

import Foundation

struct Clerk {
    func provideService(_ client: Client) {
        let second: Double = 1000000
        
        print("\(client.number)번 고객 업무 시작")
        usleep(useconds_t(0.7 * second))
        print("\(client.number)번 고객 업무 종료")
    }
}
