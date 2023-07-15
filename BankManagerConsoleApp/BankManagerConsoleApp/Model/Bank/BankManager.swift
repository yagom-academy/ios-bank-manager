//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

import Foundation

struct BankManager {
    private let taskTime = 0.7
    
    func work(client: Client) {
        let number = client.turn
        
        print("\(number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(number)번 고객 업무 완료")
    }
}
