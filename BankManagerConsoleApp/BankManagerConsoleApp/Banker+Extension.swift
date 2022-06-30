//
//  Banker+Extension.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드. on 2022/07/01.
//

import Foundation

extension Banker {
    func work(from clientQueue: inout ClientQueue<Client>) -> Int {
        var servedClient: Int = .zero

        while clientQueue.isEmpty == false {
            guard let clientIndex = clientQueue.dequeue()?.waitingNumber else {
                return .zero
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: time)
            print("\(clientIndex)번 고객 업무 완료")
            servedClient += 1
        }
        return servedClient
    }
}
