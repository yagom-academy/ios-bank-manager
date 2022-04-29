//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/04/29.
//

import Foundation

final class Bank {
  private var clientQueue: BankQueue<Client> = BankQueue(limit: 50)
  private var totalClientCount: Int = .zero
  private var totalExecuteTime: Double = .zero

  private func createClients(limit: Int, range: ClosedRange<Int>) -> BankQueue<Client> {
    var clientQueue = BankQueue<Client>(limit: limit)
    for waitingNumber in 1...Int.random(in: range) {
      let client = Client(waitingNumber: waitingNumber)
      clientQueue.enqueue(client)
    }
    return clientQueue
  }
}
