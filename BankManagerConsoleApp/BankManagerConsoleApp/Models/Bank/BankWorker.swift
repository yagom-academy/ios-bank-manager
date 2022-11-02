//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

struct BankWorker {
    func startWork(client: Client) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}
