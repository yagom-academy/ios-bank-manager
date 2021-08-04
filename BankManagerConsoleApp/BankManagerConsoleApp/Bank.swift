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
    
//    private var loanClientQueue = Queue<Client>()taskQueue
//    private var loanBankTellerQueue = Queue<BankTeller>()
//
//    private var depositClientQueue = Queue<Client>()
//    private var depositBankTellerQueue = Queue<BankTeller>()
    
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
            
//            switch bankTeller.role {
//            case .deposit:
//                depositBankTellerQueue.enqueue(value: bankTeller)
//            case .loan:
//                loanBankTellerQueue.enqueue(value: bankTeller)
//            }
        }
    }
    
    func receiveClient(clients: [Client]) {
        for client in clients {
            if let taskWaitingQueue = waitingQueue[client.task] {
                issueWaitingNumberTicket(to: client)
                taskWaitingQueue.receiveClient(client: client)
            }
            
//            switch client.task {
//            case .deposit:
//                depositClientQueue.enqueue(value: client)
//            case .loan:
//                loanClientQueue.enqueue(value: client)
//            }
        }
    }
    
    func isAllBankTellersNotCompleted() -> Bool {
        let notCompletedBankTeller = bankTellers.filter { $0.status != .completion }
        return notCompletedBankTeller.count > 0
    }
    
    func isAllClientsQueueNotEmpty() -> Bool {
        for (_, taskQueue) in waitingQueue {
            if taskQueue.isClientQueueNotEmpty() {
                return true
            }
        }
        return false
    }
    
    func doTask() -> TaskReport {
        let startTime = DispatchTime.now()
        
//        while self.depositClientQueue.isNotEmpty() || self.loanClientQueue.isNotEmpty() || isNotAllCompleted() {
        while isAllClientsQueueNotEmpty() || isAllBankTellersNotCompleted() {
//            DispatchQueue.global().async {
//                if self.depositBankTellerQueue.isNotEmpty(),
//                   let client = self.depositClientQueue.dequeue(),
//                   let bankTeller = self.depositBankTellerQueue.dequeue() {
//                    bankTeller.handleTask(with: client)
//                    self.depositBankTellerQueue.enqueue(value: bankTeller)
//                }
//            }
//            DispatchQueue.global().async {
//                if self.loanBankTellerQueue.isNotEmpty(),
//                   let client = self.loanClientQueue.dequeue(),
//                   let bankTeller = self.loanBankTellerQueue.dequeue() {
//                    bankTeller.handleTask(with: client)
//                    self.loanBankTellerQueue.enqueue(value: bankTeller)
//                }
//            }
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
//        loanClientQueue.clear()
//        loanBankTellerQueue.clear()
//        depositClientQueue.clear()
//        depositBankTellerQueue.clear()
        
        for (_, taskQueue) in waitingQueue {
            taskQueue.clear()
        }
    }
}
