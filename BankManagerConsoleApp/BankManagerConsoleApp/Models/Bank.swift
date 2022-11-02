//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank {
    var clientQueue: ClientQueue<Client> = ClientQueue()
    var bankWorker: BankWorker
    
    mutating func openBank(clients: [Client]) {
        enqueueClients(clients)
        startBankWork()
    }
    
    mutating func enqueueClients(_ clients: [Client]) {
        clients.forEach { client in
            clientQueue.enqueue(client)
        }
    }

    mutating func startBankWork() {
        guard let client = clientQueue.dequeue() else { return }
        bankWorker.startWork(client: client)
    }

//    func 업무마감() {
//         clientQueue.isEmpty -> 업무마감
//    }
}
