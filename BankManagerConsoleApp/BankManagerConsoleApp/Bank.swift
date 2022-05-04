//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

final class Bank {
  private enum Constants {
    static let closed = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
  }

  private var clientQueue: BankQueue<Client>
  private var totalClientCount = Int.zero
  private var totalExecuteTime = Double.zero

  init(maxClient: Int) {
    clientQueue = BankQueue(limit: maxClient)
  }

  func open() {
    totalClientCount = clientQueue.count
    totalExecuteTime = measureTaskTime {
      executeBankTask()
    }
    print(String(format: Constants.closed, totalClientCount, totalExecuteTime))
  }

  func addClients(_ clients: [Client]) {
    for client in clients {
      clientQueue.enqueue(client)
    }
  }

  private func executeBankTask() {
    while clientQueue.isEmpty == false, let client = clientQueue.dequeue() {
      let time = BankDepositTask().execute(client)
    }
  }

  private func measureTaskTime(_ block: () -> Void) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    return end - start
  }
}
