//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let depositClerk: Clerk
    private let loanClerk: Clerk
    private var clients: CustomerQueue<Client>
    
    private let clientGroup = DispatchGroup()
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    init(depositClerk: Clerk = Clerk(),
         loanClerk: Clerk = Clerk(),
         clients: CustomerQueue<Client> = CustomerQueue()) {
        self.depositClerk = depositClerk
        self.loanClerk = loanClerk
        self.clients = clients
    }
    
    func openBank() {
        print("\(Selections.run) : 은행개점\n\(Selections.dismiss) : 종료")
        print("입력 :", terminator: " ")
        let selection = readLine()
        
        switch selection {
        case Selections.run:
            issueTickets()
            return
        case Selections.dismiss:
            return
        default:
            openBank()
            return
        }
    }
    
    private func issueTickets() {
        let customerNumber = Int.random(
            in: Customer.minimumNumbers...Customer.maximumNumbers
        )
        
        let tickets = Array(1...customerNumber)
        tickets.forEach {
            if let business = Service.allCases.randomElement() {
                clients.enqueue(Client(number: $0, business: business))
            }
        }
        
        startWork()
        return
    }
    
    private func startWork() {
        var servedClients = 0
        var timeSpent = 0.0
        
        while let client = self.clients.dequeue() {
            servedClients += 1
            
            DispatchQueue.global().async(group: clientGroup) {
                switch client.business {
                case .deposit:
                    self.depositSemaphore.wait()
                    timeSpent += self.depositClerk.provideService(client)
                    self.depositSemaphore.signal()
                case .loan:
                    self.loanSemaphore.wait()
                    timeSpent += self.loanClerk.provideService(client)
                    self.loanSemaphore.signal()
                }
            }
        }
        
        clientGroup.wait()
        finishWork(customers: servedClients, time: timeSpent)
        openBank()
        return
    }
    
    private func finishWork(customers: Int, time: Double) {
        let formattedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(formattedTime)초입니다.")
    }
}
