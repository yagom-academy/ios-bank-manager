//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

class Bank {
    
    private var clientQueue = Queue<Client>()
    
    func lineUp(_ client: Client) {
        clientQueue.enqueue(client)
    }
    
    func start() {
        var clientCount: Int = .zero
        var workingDuration: Double = .zero
        while true {
            guard let client = clientQueue.dequeue() else {
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(workingDuration.roundedOff)초입니다.")
                return
            }
            service(client)
            clientCount += 1
            workingDuration += Task.deposit.duration
        }
    }
    
    private func service(_ client: Client) {
        print("\(client.waitingNumber)번 고객 업무 시작")
        client.task.work()
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}
