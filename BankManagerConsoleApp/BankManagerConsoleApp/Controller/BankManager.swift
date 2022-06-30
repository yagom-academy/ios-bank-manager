//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    let firstClerk = Clerk()
    var clients = CustomerQueue<Client>()
}

extension BankManager {
    func openBank() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 :", terminator: " ")
        let selection = readLine()
        
        switch selection {
        case "1":
            issueTickets()
        case "2":
            return
        default:
            openBank()
            return
        }
    }

    private func issueTickets() {
        let customerNumber = Int.random(in: 10...30)
        
        for i in 1...customerNumber {
            clients.enqueue(Client(number: i))
        }
        
        defer {
            startWork()
        }
        
        return
    }
    
    private func startWork() {
        //처리한 client 수랑, 처리하며 걸린 시간
        var finished = 0
        var timeUsed = 0.0
        
        while clients.isNotEmpty {
            guard let client = clients.dequeue() else {
                return
            }
            
            firstClerk.provideService(client)
            finished += 1
            timeUsed += 0.7
        }
                
        defer {
            finishedWork(finished: finished, timeUsed: timeUsed)
            openBank()
        }
        
        return
    }
    
    private func finishedWork(finished: Int, timeUsed: Double) {
        let formattedTime = String(format: "%.2f", timeUsed)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(finished)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
