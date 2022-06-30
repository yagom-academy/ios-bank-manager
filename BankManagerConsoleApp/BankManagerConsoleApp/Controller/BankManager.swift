//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

final class BankManager {
    let firstClerk = Clerk()
    var clients = CustomerQueue<Client>()
}

extension BankManager {
    func openBank() {
        print("1 : 은행개점\n2 : 종료\n입력 : ")
        let selection = readLine()
        
        // TODO: switch 안에서도 defer가 작동할까?
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
        while clients.isNotEmpty {
            guard let client = clients.dequeue() else {
                // TODO: 업무 종료 알림
                return
            }
            
            firstClerk.provideService(client)
        }
        
        // TODO: 업무 종료 알림
        
        defer {
            openBank()
        }
        
        return
    }
}
