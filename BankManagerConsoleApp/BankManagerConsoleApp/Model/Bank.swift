//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

final class Bank {
  private var clientQueue: BankQueue<Client>
  private var totalClientCount = Int.zero
  private var totalExecuteTime = Double.zero
  private let logger = Logger()

  init(maxClient: Int) {
    clientQueue = BankQueue(limit: maxClient)
  }

  func open() {
    totalClientCount = clientQueue.count
    totalExecuteTime = measureTaskTime {
      executeBankTask()
    }
    logger.log(.closed(totalClientCount: totalClientCount, totalExecuteTime: totalExecuteTime))
  }

  func addClients(_ clients: [Client]) {
    for client in clients {
      clientQueue.enqueue(client)
    }
  }

  private func executeBankTask() {
    let group = DispatchGroup()
    while let client = clientQueue.dequeue() {
      DispatchQueue.global().async(group: group) {
        client.taskType.semaphore.wait()
        client.taskType.execute(client)
        client.taskType.semaphore.signal()
      }
    }
    group.wait()
  }

  private func measureTaskTime(_ block: () -> Void) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    return end - start
  }
}
