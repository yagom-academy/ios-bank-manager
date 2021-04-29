//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  private var customers: [Int:Customer] = [:]
  private var bankManager = BankManager()
  
  init(numOfManagers: Int) {
    let randomNumber = Int.random(in: 10...30)
    for ticketNumber in 1...randomNumber {
      customers[ticketNumber] = Customer(order: ticketNumber)
    }
    
    for counterNumber in 1...numOfManagers {
      bankManager.setBankCounters(number: counterNumber)
    }
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(removeCustomer(notification:)),
      name: NSNotification.Name(rawValue: "noti"),
      object: nil)
  }
  
  func open() {
    let openTime = CFAbsoluteTimeGetCurrent()
    
    var isRepeat = true
    repeat {
      if customers.isEmpty {
        isRepeat = false
      }
      
      bankManager.process(customers)
    } while isRepeat
    
    bankManager.operationQueue.waitUntilAllOperationsAreFinished()
    close(from: openTime)
  }
  
  func close(from openTime: CFAbsoluteTime) {
    let closeTime = CFAbsoluteTimeGetCurrent()

    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(bankManager.showTotalCompletedCustomer())명이며,
    총 업무 시간은 \(closeTime - openTime)초입니다.
    """
    print(complateString)
  }
}

// MARK: - BankManagerProcess
extension Bank {
  @objc func removeCustomer(notification: Notification) {
    if let userInfo = notification.userInfo {
      customers.removeValue(forKey: userInfo["current"] as! Int)
    }
  }
}
