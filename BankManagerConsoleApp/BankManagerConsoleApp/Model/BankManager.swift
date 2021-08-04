//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Yongwoo Marco on 2021/08/02.
//

import Foundation



final class BankManager {
    private var clientQueue: Queue<Client> = .init()
    private var manager: BankTeller = BankTeller()
    private var clientCount: Int = 0
    private var totalTime: Double = 0
    
    private func makeRandomNumber() -> Int {
        return Int.random(in: 10...30)
    }
    
    private func lineUpClients(_ numberOfClients: Int) {
        for number in 1...numberOfClients {
        }
    }
    
    func open() {
        while let client = clientQueue.dequeue() {
            manager.serve(client) {
                totalTime += $0
                clientCount += 1
            }
        }
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
    }
}
