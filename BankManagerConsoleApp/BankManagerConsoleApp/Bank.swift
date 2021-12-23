//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/23.
//

import Foundation

struct Bank {
  let banker: Banker = Banker()
  let numberOfClients = Int.random(in: 10...30)
  var clientQueue = Queue<Client>()
  
  mutating func openBank() {
    clientLineUp()
    doWork()
  }
  
  mutating func clientLineUp() {
    for sequence in 1...numberOfClients {
      clientQueue.enqueue(Client(sequence: sequence))
    }
  }
  
  mutating func doWork() {
    for _ in 1...numberOfClients {
      guard let client = clientQueue.dequeue() else {
        return
      }
      banker.doTask(clientSequence: client.sequence)
    }
  }
}
