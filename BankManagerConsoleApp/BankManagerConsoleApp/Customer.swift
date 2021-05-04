//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Customer: Operation {
  private let ticketNumber: Int
  private var grade: CustomerGrade
  private let task: TaskType
  
  override var queuePriority: Operation.QueuePriority {
    get {
      switch grade {
      case .vvip:
        return .veryHigh
      case .vip:
        return .normal
      case .normal:
        return .veryLow
      }
    }
    
    set {
      switch newValue {
      case .veryHigh:
        self.grade = .vvip
      case .normal:
        self.grade = .vip
      case .veryLow:
        self.grade = .normal
      default:
        self.grade = .normal
      }
    }
  }
  
  init(order orderNumber: Int, grade: CustomerGrade, task: TaskType) {
    self.ticketNumber = orderNumber
    self.grade = grade
    self.task = task
  }
  
  func showTicketNumber() -> Int {
    return ticketNumber
  }
  
  func showGrade() -> CustomerGrade {
    return grade
  }
  
  func showTask() -> TaskType {
    return task
  }
}

enum CustomerGrade: Int {
  case vvip = 0
  case vip = 1
  case normal = 2
}

extension CustomerGrade: CustomStringConvertible {
  var description: String {
    switch self {
    case .vvip:
      return "VVIP"
    case .vip:
      return "VIP"
    case .normal:
      return "일반"
    }
  }
}

enum TaskType: Int {
  case deposit = 0
  case loan = 1
  
  var taskTime: Double {
    switch self {
    case .deposit:
      return 0.7
    case .loan:
      return 1.1
    }
  }
}

extension TaskType: CustomStringConvertible {
  var description: String {
    switch self {
    case .deposit:
      return "예금"
    case .loan:
      return "대출"
    }
  }
}
