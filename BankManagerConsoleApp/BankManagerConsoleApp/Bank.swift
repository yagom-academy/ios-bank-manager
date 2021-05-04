//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

protocol Bankable {
  var customers: [Int:Customer] { get set }
  var bankManager: BankManager { get set }
  
  func open()
  func close(from openTime: CFAbsoluteTime)
}

extension Bankable {
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
    let totalWorkTime = round((closeTime - openTime) * 100) / 100
    
    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(bankManager.showTotalCompletedCustomer())명이며,
    총 업무 시간은 \(totalWorkTime)초입니다.
    """
    print(complateString)
  }
}

final class Bank: Bankable {
  var customers: [Int:Customer] = [:]
  var bankManager = BankManager()
  
  init(numOfManagers: Int) throws {
    let randomNumber = Int.random(in: 10...30)
    customers = try setCustomer(count: randomNumber)
    
    for counterNumber in 1...numOfManagers {
      bankManager.setBankCounters(number: counterNumber)
    }
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(removeCustomer(notification:)),
      name: NSNotification.Name(rawValue: "completedCustomer"),
      object: nil)
  }
}

// MARK: - NotificationCenter Method
extension Bank {
  @objc func removeCustomer(notification: Notification) {
    if let userInfo = notification.userInfo {
      guard let ticketNumber = userInfo["ticketNumber"] as? Int else {
        return
      }
      customers.removeValue(forKey: ticketNumber)
    }
  }
}

extension Bank {
  private func setCustomer(count: Int) throws -> [Int:Customer] {
    var customers: [Int:Customer] = [:]
    for ticketNumber in 1...count {
      guard let grade = CustomerGrade(rawValue: Int.random(in: 0...2)) else {
        throw BankError.invalidNumberOfCustomers
      }
      
      guard let task = TaskType(rawValue: Int.random(in: 0...1)) else {
        throw BankError.invalidNumberOfCustomers
      }
      
      customers[ticketNumber] = Customer(order: ticketNumber, grade: grade, task: task)
    }
    return customers
  }
}
