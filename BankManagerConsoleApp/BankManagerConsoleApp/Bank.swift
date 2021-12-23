//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/23.
//

import Foundation

struct Bank {
  private let banker: Banker = Banker()
  let numberOfClients = Int.random(in: 10...30)
  private var clientQueue = Queue<Client>()
  private var openTime = CFAbsoluteTime()
  private var closeTime = CFAbsoluteTime()
  
  mutating func doBanking() {
    openTime = CFAbsoluteTimeGetCurrent()
    clientLineUp()
    doWork()
    closeTime = CFAbsoluteTimeGetCurrent()
  }
  
  func workingTime() -> String {
    let timeInterval = closeTime - openTime
    
    let numberFormatter = NumberFormatter()
    numberFormatter.roundingMode = .floor
    numberFormatter.maximumSignificantDigits = 3
    
    let workingTime = numberFormatter.string(for: Double(timeInterval)) ?? ""
    return workingTime
  }
  
  private mutating func clientLineUp() {
    for sequence in 1...numberOfClients {
      clientQueue.enqueue(Client(sequence: sequence))
    }
  }
  
  private mutating func doWork() {
    for _ in 1...numberOfClients {
      guard let dequeueClient = clientQueue.dequeue() else {
        return
      }
      banker.doTask(client: dequeueClient)
    }
  }
}
