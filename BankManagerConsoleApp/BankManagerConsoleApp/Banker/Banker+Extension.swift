//
//  Banker+Extension.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/01.
//

import Foundation

extension Banker {
    func work(from client: Client) {
        print("\(client.waitingNumber)번 고객 \(client.desiredServices)업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(client.waitingNumber)번 고객 \(client.desiredServices)업무 완료")
    }
}
