//
//  TaskQueue.swift
//  BankManagerConsoleApp
//
//  Created by YongHoon JJo on 2021/08/05.
//

import Foundation

class TaskQueue {
    private var clientQueue = Queue<Client>()
    private var bankTellerQueue = Queue<BankTeller>()
    
    func readyForWork(bankTeller: BankTeller) {
        bankTellerQueue.enqueue(value: bankTeller)
    }
    
    func receiveClient(client: Client) {
        clientQueue.enqueue(value: client)
    }
    
    func isClientQueueNotEmpty() -> Bool {
        return clientQueue.isNotEmpty()
    }
    
    func isBankTellerQueueNotEmpty() -> Bool {
        return bankTellerQueue.isNotEmpty()
    }
    
    func dequeueClient() -> Client? {
        return clientQueue.dequeue()
    }
    
    func dequeueBankTeller() -> BankTeller? {
        return bankTellerQueue.dequeue()
    }
    
    func clear() {
        clientQueue.clear()
        bankTellerQueue.clear()
    }
}
