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
  private var totalClientCount: Int = .zero
  private var totalExecuteTime: Double = .zero

  init(limit: Int) {
    clientQueue = BankQueue(limit: limit)
  }

  func open() {
    totalClientCount = clientQueue.count
    execute()
    close()
  }

  func addClient(_ client: Client) {
    clientQueue.enqueue(client)
  }

  private func execute() {
    while !clientQueue.isEmpty, let client = clientQueue.dequeue() {
      let time = BankTask().execute(client)
      totalExecuteTime += time
    }
  }

  private func close() {
    print(String(format: Constants.closed, totalClientCount, totalExecuteTime))
  }
}
