//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

import Foundation

struct BankManager {
    func work(client: Client) {
        let number = client.turn
        
        print("\(Thread.current)")
        print("\(number)번 고객 \(client.banking.rawValue) 업무 시작")
        Thread.sleep(forTimeInterval: client.banking.taskTime)
        print("\(Thread.current)")
        print("\(number)번 고객 \(client.banking.rawValue) 업무 완료")
    }
}
