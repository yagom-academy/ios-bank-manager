//
//  Bankerable+.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/07.
//

import Foundation

extension Bankerable {
    func startWork(client: Client) {
        print("\(client.waitingTicket)번 고객 \(client.purpose.name)업무 시작")
        selectWork(purpose: client.purpose)
        print("\(client.waitingTicket)번 고객 \(client.purpose.name)업무 종료")
    }
    
    private func selectWork(purpose: Client.Purpose) {
        switch purpose {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        case .loan:
            Thread.sleep(forTimeInterval: 1.1)
        }
    }
}
