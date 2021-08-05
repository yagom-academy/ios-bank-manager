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
    private var taskWaitingQueues: [TaskCategory: WaitingQueue] = [:]
    
    init () {
        for taskCase in TaskCategory.allCases {
            taskWaitingQueues[taskCase] = WaitingQueue()
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
            if let taskWaitingQueue = taskWaitingQueues[bankTeller.role] {
                taskWaitingQueue.readyForWork(bankTeller: bankTeller)
            }
        }
    }
    
    func receiveClient(clients: [Client]) {
        for client in clients {
            if let taskWaitingQueue = taskWaitingQueues[client.task] {
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
        for (_, waitingQueue) in taskWaitingQueues {
            if waitingQueue.isClientQueueNotEmpty() {
                return true
            }
        }
        return false
    }
    
    func doTask() -> TaskReport {
        let startTime = DispatchTime.now()
        
        while isSomeClientsQueueNotEmpty() || isAllBankTellersNotCompleted() {
            for (_, waitingQueue) in taskWaitingQueues {
                DispatchQueue.global().async {
                    if waitingQueue.isBankTellerQueueNotEmpty(),
                       let client = waitingQueue.dequeueClient(),
                       let bankTeller = waitingQueue.dequeueBankTeller() {
                        bankTeller.handleTask(with: client) {
                            waitingQueue.readyForWork(bankTeller: bankTeller)
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
        
        for (_, taskQueue) in taskWaitingQueues {
            taskQueue.clear()
        }
    }
}
