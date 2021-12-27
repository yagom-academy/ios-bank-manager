//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/23.
//

import Foundation

class Bank {
  private var bankers: [Banker]
  private let numberOfClients = Int.random(in: 10...30)
  private var clientQueue = Queue<Client>()
  private var operatingTimeManager: OperatingTimeManager
  private let semaphore = DispatchSemaphore(value: 1)

  init(bankers: [Banker], operatingTimeManager: OperatingTimeManager) {
    self.bankers = bankers
    self.operatingTimeManager = operatingTimeManager
  }

  func doBanking() {
      operatingTimeManager.openTime = CFAbsoluteTimeGetCurrent()
      clientLineUp()
      doWork()
      operatingTimeManager.closeTime = CFAbsoluteTimeGetCurrent()
      print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 (numberOfClients)명이며,"
            + "총 업무시간은 (operatingTimeManager.workingTime())초입니다.")
  }

  private func clientLineUp() {
    for sequence in 0..<numberOfClients {
      clientQueue.enqueue(Client(sequence: sequence))
    }
  }

  private func doWork() {
    let doWorkDispatchgroup = DispatchGroup()

    for bankerNumber in 0..<bankers.count {
      DispatchQueue.global().async(group: doWorkDispatchgroup) {
        (0..<self.numberOfClients).forEach() { _ in
          self.semaphore.wait()
          guard let dequeueClient = self.clientQueue.dequeue() else {
            self.semaphore.signal()
            return
          }
          self.semaphore.signal()
          self.bankers[bankerNumber].doTask(client: dequeueClient)
        }
      }
    }
    doWorkDispatchgroup.wait()
  }
}
