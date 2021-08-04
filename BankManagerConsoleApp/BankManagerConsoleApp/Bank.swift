//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

typealias TaskReport = (numberOfClient: UInt, totalTaskTime: Double)

class Bank {
    // MARK:- private Properties
    private var bankTellers: [BankTeller] = []
    private var queueTicketMachine = QueueTicketMachine()
    private var waitingQueue: [TaskCategory: TaskQueue] = [:]
    
    init () {
        for taskCase in TaskCategory.allCases {
            waitingQueue[taskCase] = TaskQueue()
        }
    }
}

// MARK:- private Methods
extension Bank {
    private func issueWaitingNumberTicket(to client: Client) {
        let queueTicket = queueTicketMachine.issueWatingNumberTicket()
        client.setQueueTicket(queueTicket: queueTicket)
    }
    
    private func calculateTotalTaskTime(start: DispatchTime, end: DispatchTime) -> Double {
        return Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1000000000
    }
}

// MARK:- internal Methods (BankManager executeBankBusiness() 에서 호출되는 메서드들)
extension Bank {
    func setBankTellers(bankTellers: [BankTeller]) {
        self.bankTellers = bankTellers
    }
    
    func readyForWork() {
        for bankTeller in bankTellers {
            if let taskWaitingQueue = waitingQueue[bankTeller.role] {
                taskWaitingQueue.readyForWork(bankTeller: bankTeller)
            }
        }
    }
    
    func receiveClient(clients: [Client]) {
        for client in clients {
            if let taskWaitingQueue = waitingQueue[client.task] {
                issueWaitingNumberTicket(to: client)
                taskWaitingQueue.receiveClient(client: client)
            }
        }
    }
    
    func isAllBankTellersNotCompleted() -> Bool {
        let notCompletedBankTeller = bankTellers.filter { $0.status != .completion }
        return notCompletedBankTeller.count > 0
    }
    
    func isSomeClientsQueueNotEmpty() -> Bool {
        for (_, taskQueue) in waitingQueue {
            if taskQueue.isClientQueueNotEmpty() {
                return true
            }
        }
        return false
    }
    
    func doTask() -> TaskReport {
        let startTime = DispatchTime.now()
        
        while isSomeClientsQueueNotEmpty() || isAllBankTellersNotCompleted() {
            for (_, taskQueue) in waitingQueue {
                DispatchQueue.global().async {
                    if taskQueue.isBankTellerQueueNotEmpty(),
                       let client = taskQueue.dequeueClient(),
                       let bankTeller = taskQueue.dequeueBankTeller() {
                        bankTeller.handleTask(with: client) {
                            taskQueue.readyForWork(bankTeller: bankTeller)
                        }   
                    }
                }
            }
        }
        
        let endTime = DispatchTime.now()
        let totalTaskTIme = calculateTotalTaskTime(start: startTime, end: endTime)
        let numberOfClient = queueTicketMachine.getCurrentTicketNumber
        
        return (numberOfClient, totalTaskTIme)
    }
    
    func finishWork() {
        queueTicketMachine.reset()
        
        for (_, taskQueue) in waitingQueue {
            taskQueue.clear()
        }
    }
}
