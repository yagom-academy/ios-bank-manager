//
//  ClientManager.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct ClientManeger {
    private let minClientCount: Int
    private let maxClientCount: Int
    private lazy var randomClientCount: Int = {
        return Int.random(in: minClientCount...maxClientCount)
    }()

    init(minClientCount: Int, maxClientCount: Int) {
        self.minClientCount = minClientCount
        self.maxClientCount = maxClientCount
    }

    mutating func makeClientQueue() -> Queue<Client> {
        var queue = Queue<Client>()
        for waitingNumber in 1...randomClientCount {
            queue.enqueue(Client(waitingNumber: waitingNumber))
        }
        return queue
    }
}
