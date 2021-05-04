//
//  BankCounter.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/29.
//

import Foundation

final class BankManager {
  let operationQueue = OperationQueue()
  
  private var bankers: [Int:Banker] = [:]
  private var currentTicketNumber = 1
  private var totalCompletedCustomer = 0
  
  func process(vvipQueue: Queue<Customer>,
               vipQueue: Queue<Customer>,
               normalQueue: Queue<Customer>,
               ​completionHandler: @escaping (()->Void) = { }) {
    if !vvipQueue.isEmpty {
      process(grade: .vvip, vvipQueue)
    } else if !vipQueue.isEmpty {
      process(grade: .vip, vipQueue)
    } else if !normalQueue.isEmpty {
      process(grade: .normal, normalQueue)
    }
  }
  
  private func process(grade: CustomerGrade, _ queue: Queue<Customer>) {
    guard !bankers.isEmpty else {
      operationQueue.waitUntilAllOperationsAreFinished()
      return
    }
    
    let workableBanker = self.bankers.first?.value
    guard let counterNumber = workableBanker?.showCounterNumber() else {
      return
    }
    self.bankers.removeValue(forKey: counterNumber)
    
    NotificationCenter.default.post(
      name: NSNotification.Name(rawValue: "completedCustomer"),
      object: nil,
      userInfo: ["userGrade":grade, "ticketNumber":currentTicketNumber])
    
    currentTicketNumber += 1
    
    operationQueue.addOperation {
      guard let firstElement = queue.front else { return }
      workableBanker?.process(firstElement)
      self.bankers[counterNumber] = workableBanker
      self.totalCompletedCustomer += 1
    }
    
  }
  
  func setBankCounters(number: Int) {
    bankers[number] = Banker(number)
  }

  func showTotalCompletedCustomer() -> Int {
    return totalCompletedCustomer
  }
}
