//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

final class Bank<Queue: ClientQueueable> {
    private let bankDispatchGroup = DispatchGroup()
    private let depositBooth = DispatchSemaphore(value: 2)
    private let loanBooth = DispatchQueue(label: "loanBanker")
    
    private let banker: BankWorkable
    private var clientQueue: Queue
    private var bankManager: BankManagable
    
    init(banker: BankWorkable, queue: Queue, bankManager: BankManagable) {
        self.banker = banker
        self.clientQueue = queue
        self.bankManager = bankManager
    }
    
    func updateClientQueue() -> Client? {
        guard let randomPurpose = Client.Purpose.allCases.randomElement() else { return nil }
        let client = Client(waitingTicket: bankManager.checkCount() + 1, purpose: randomPurpose)
        clientQueue.enqueue(client)
        bankManager.addClientCount()
        return client
    }
    
    func startBankWork() {
        bankManager.resetWorkTime()
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            divideWork(client: client)
        }
        
//        bankDispatchGroup.wait()
        bankManager.addWorkTime()
    }
    
    private func divideWork(client: Client) {
        switch client.purpose {
        case .deposit:
            DispatchQueue.global().async(group: bankDispatchGroup) { [self] in
                self.depositBooth.wait()
                defer { self.depositBooth.signal() }
                NotificationCenter.default.post(name: .workStart, object: nil, userInfo: [ClientNoti.client : client])
                self.banker.startWork(client: client)
                NotificationCenter.default.post(name: .workEnd, object: nil, userInfo: [ClientNoti.client : client])
            }
        case .loan:
            loanBooth.async(group: bankDispatchGroup) { [self] in
                NotificationCenter.default.post(name: .workStart, object: nil, userInfo: [ClientNoti.client : client])
                self.banker.startWork(client: client)
                NotificationCenter.default.post(name: .workEnd, object: nil, userInfo: [ClientNoti.client : client])
            }
        }
    }
}

extension Notification.Name {
    static let  workStart = Notification.Name("workStart")
    static let  workEnd = Notification.Name("workEnd")
}

enum ClientNoti {
    case client
}
