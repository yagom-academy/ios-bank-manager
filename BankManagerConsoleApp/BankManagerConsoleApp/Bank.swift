//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/23.
//

import Foundation

class Bank {
  private let numberOfClients: Int
  private var bankers: [Banker]
  private var clientQueue = Queue<Client>()
  private var operatingTimeManager: OperatingTimeManager
  private let semaphore = DispatchSemaphore(value: 1)

  init(numberOfClients: Int, bankers: [Banker], clientQueue: Queue<Client>, operatingTimeManager: OperatingTimeManager) {
    self.numberOfClients = numberOfClients
    self.bankers = bankers
    self.clientQueue = clientQueue
    self.operatingTimeManager = operatingTimeManager
  }
  
  func doBanking() {
    operatingTimeManager.openTime = CFAbsoluteTimeGetCurrent()
    doWork()
    operatingTimeManager.closeTime = CFAbsoluteTimeGetCurrent()
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며,"
          + "총 업무시간은 \(operatingTimeManager.workingTime())초입니다.")
  }
  
  private func doWork() {
    let doWorkDispatchgroup = DispatchGroup()
    
    for bankerNumber in 0..<bankers.count {
      DispatchQueue.global().async(group: doWorkDispatchgroup) {
        self.provideService(bankerNumber: bankerNumber)
      }
    }
    doWorkDispatchgroup.wait()
  }
  
  private func provideService(bankerNumber: Int) {
    while let firstClient = clientQueue.peek() {
      if firstClient.requiredBankingType == self.bankers[bankerNumber].assignedTask {
        self.semaphore.wait()
        guard let dequeueClient = self.clientQueue.dequeue() else {
          return
        }
        self.bankers[bankerNumber].doTask(client: dequeueClient)
      }
      self.semaphore.signal()
    }
  }
}
