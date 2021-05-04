//
//  BankCounter.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/29.
//

import Foundation

final class BankManager {
  var operationQueue: OperationQueue
  var customers: [Customer] = []
  
  init(numberOfBankers: Int) {
    self.operationQueue = OperationQueue()
    //TODO: CustomerMaker를 통한 customers 초기화
    operationQueue.maxConcurrentOperationCount = numberOfBankers
  }
  
  func inputCustomersIntoOperationQueue() -> Int {
    let totalCustomerCount = customers.count

    return totalCustomerCount
  }
}
