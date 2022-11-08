//
//  ClientQueue.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

struct ClientQueue: ClientQueueable {
    typealias Element = Client

    var list: LinkedList<Client> = LinkedList()
}
