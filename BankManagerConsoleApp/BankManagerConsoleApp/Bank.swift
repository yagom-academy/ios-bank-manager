//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

protocol Bankable {
  var customers: Queue<Customer> { get set }
  var bankManager: BankManager { get set }
  var vvipQueue: Queue<Customer> { get set }
  var vipQueue: Queue<Customer> { get set }
  var normalQueue: Queue<Customer> { get set }
  
  func open()
  func close(from openTime: CFAbsoluteTime)
}

extension Bankable {
  func open() {
    let openTime = CFAbsoluteTimeGetCurrent()
    
    var isRepeat = true
    repeat {
      if vvipQueue.isEmpty && vipQueue.isEmpty && normalQueue.isEmpty {
        isRepeat = false
      }
      
      bankManager.process(vvipQueue: vvipQueue, vipQueue: vipQueue, normalQueue: normalQueue)
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
  var customers: Queue<Customer> = Queue<Customer>()
  var vvipQueue: Queue = Queue<Customer>()
  var vipQueue: Queue = Queue<Customer>()
  var normalQueue: Queue = Queue<Customer>()
  var bankManager = BankManager()
  
  init(numOfManagers: Int) throws {
    let randomNumber = Int.random(in: 10...30)
    customers = try setCustomer(count: randomNumber)
    
    vvipQueue = divideCustomerByGrade(customers, grade: .vvip)
    vipQueue = divideCustomerByGrade(customers, grade: .vip)
    normalQueue = divideCustomerByGrade(customers, grade: .normal)
    
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
      guard let userGrade = userInfo["userGrade"] as? CustomerGrade else {
        return
      }
      removeCustomer(accordingTo: userGrade)
    }
  }
  
  private func removeCustomer(accordingTo userGrade: CustomerGrade) {
    switch userGrade {
    case .vvip:
      _ = vvipQueue.dequeue()
    case .vip:
      _ = vipQueue.dequeue()
    case .normal:
      _ = normalQueue.dequeue()
    }
  }
}

// MARK: - Function About Customer
extension Bank {
  private func setCustomer(count: Int) throws -> Queue<Customer> {
    var customers: Queue<Customer> = Queue<Customer>()
    for ticketNumber in 1...count {
      guard let grade = CustomerGrade(rawValue: Int.random(in: 0...2)) else {
        throw BankError.invalidNumberOfCustomers
      }
      
      guard let task = TaskType(rawValue: Int.random(in: 0...1)) else {
        throw BankError.invalidNumberOfCustomers
      }
      
      customers.enqueue(Customer(order: ticketNumber, grade: grade, task: task))
    }
    return customers
  }
  
  private func divideCustomerByGrade(_ customers: Queue<Customer>, grade: CustomerGrade) -> Queue<Customer> {
    var queue: Queue<Customer> = Queue<Customer>()
    queue = customers.filter{ $0.showGrade() == grade }
    return queue
  }
}
