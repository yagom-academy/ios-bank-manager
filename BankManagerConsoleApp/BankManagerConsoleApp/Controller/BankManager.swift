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
            defer {
                issueTickets()
            }
            return
        case "2":
            return
        default:
            defer {
                openBank()
            }
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
        var servedClients = 0
        var timeSpent = 0.0
        
        while let client = clients.dequeue() {
            firstClerk.provideService(client)
            servedClients += 1
            timeSpent += 0.7
        }
                
        defer {
            finishWork(customers: servedClients, time: timeSpent)
            openBank()
        }
        
        return
    }
    
    private func finishWork(customers: Int, time: Double) {
        let formattedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
