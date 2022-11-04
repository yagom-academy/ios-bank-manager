//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

struct BankWorker {
    func startWork(client: Client) {
        print("\(client.waitingTicket)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client.waitingTicket)번 고객 업무 완료")
    }
}
