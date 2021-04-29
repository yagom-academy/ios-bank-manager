//
//  BankCounter.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/29.
//

import Foundation

class BankManager {
  let operationQueue = OperationQueue()

  private var bankers: [Int:Banker] = [:]
  private var currentTicketNumber = 1
  private var totalCompletedCustomer = 0
  
  func process(_ customers: [Int:Customer]) {
    if let customer = customers[currentTicketNumber] {
      guard !bankers.isEmpty else {
        operationQueue.waitUntilAllOperationsAreFinished()
        return
      }
      
      let workableBanker = self.bankers.first?.value
      self.bankers.removeValue(forKey: workableBanker?.showCounterNumber() ?? 0)

      NotificationCenter.default.post(
        name: NSNotification.Name(rawValue: "noti"),
        object: nil,
        userInfo: ["current":currentTicketNumber])

      currentTicketNumber += 1

      operationQueue.addOperation {
        workableBanker?.process(customer)
        
        self.bankers[workableBanker?.showCounterNumber() ?? 0] = workableBanker
        self.totalCompletedCustomer += 1
      }
    }
  }
  
  func setBankCounters(number: Int) {
    bankers[number] = Banker(number)
  }
  
  func startBankWork(counter: Int) {
    bankers[counter] = nil
  }
  
  func showTotalCompletedCustomer() -> Int {
    return totalCompletedCustomer
  }
}
