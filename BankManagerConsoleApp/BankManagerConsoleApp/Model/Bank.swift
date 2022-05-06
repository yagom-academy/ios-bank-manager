//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

final class Bank {
  private var clientQueue: BankQueue<Client>
  private var totalClerk: DispatchSemaphore
  private var totalClientCount = Int.zero
  private var totalExecuteTime = Double.zero

  init(maxClient: Int, totalClerkCount: Int) {
    clientQueue = BankQueue(limit: maxClient)
    totalClerk = DispatchSemaphore(value: totalClerkCount)
  }

  func open() {
    totalClientCount = clientQueue.count
    totalExecuteTime = measureTaskTime {
      executeBankTask()
    }
    Logger.shared.log(.closed(count: totalClientCount, time: totalExecuteTime))
  }

  func addClients(_ clients: [Client]) {
    for client in clients {
      clientQueue.enqueue(client)
    }
  }

  private func executeBankTask() {
    let group = DispatchGroup()
    while let client = clientQueue.dequeue() {
      totalClerk.wait()
      DispatchQueue.global().async(group: group) {
        client.taskType.semaphore.wait()
        client.taskType.execute(client)
        client.taskType.semaphore.signal()
        self.totalClerk.signal()
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
