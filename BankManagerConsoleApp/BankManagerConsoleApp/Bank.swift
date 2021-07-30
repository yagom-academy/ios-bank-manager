//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

typealias TaskReport = (UInt, Double)

class Bank {
    var clientQueue: Queue<Client> = Queue<Client>()
    var bankTellerQueue: Queue<BankTeller> = Queue<BankTeller>()
    
    var queueTicketMachine = QueueTicketMachine()
    
    init(numberOfBankTeller: UInt = 1) {
        for _ in 1...numberOfBankTeller {
            bankTellerQueue.enqueue(value: BankTeller())
        }
    }
    
    func issueQueueTicket(to client: Client) {
        let queueTicket = queueTicketMachine.issueQueueTicket()
        client.setQueueTicket(queueTicket: queueTicket)
    }
    
    func receiveClient(clients: [Client]) {
        for client in clients {
            issueQueueTicket(to: client)
            clientQueue.enqueue(value: client)
        }
    }
    
    private func calculateTotalTaskTime(start: DispatchTime, end: DispatchTime) -> Double {
        return Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1000000000
    }
    
    func doTask() -> TaskReport {
        let startTime = DispatchTime.now()
        
        while !clientQueue.isEmpty() {
            if !bankTellerQueue.isEmpty(),
               let client = clientQueue.dequeue(),
               let bankTeller = bankTellerQueue.dequeue() {
                bankTeller.handleTask(with: client)
                bankTellerQueue.enqueue(value: bankTeller)
            }
        }
        
        let endTime = DispatchTime.now()
        let totalTaskTIme = calculateTotalTaskTime(start: startTime, end: endTime)
        let numberOfClient = queueTicketMachine.getCurrentTicketNumber()
        
        return (numberOfClient, totalTaskTIme)
    }
}
