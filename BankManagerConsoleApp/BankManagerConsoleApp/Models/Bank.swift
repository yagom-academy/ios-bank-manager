//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank {
    var clientQueue: ClientQueue<Client> = ClientQueue()
    
    mutating func enqueueClients(_ clients: [Client]) {
        clients.forEach { client in
            clientQueue.enqueue(client)
        }
    }
    
//    mutating func 개점() {
//        enqueueClients([])
//        업무시작()
//    }
//
//    mutating func 업무시작() {
//        clerk.업무처리하기(어떤고객: clientQueue.dequeue()!)
//    }
//
//    func 업무마감() {
//         clientQueue.isEmpty -> 업무마감
//    }
}

