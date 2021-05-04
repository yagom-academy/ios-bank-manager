//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

struct Customer: Hashable {
  private let ticketNumber: Int
  private let grade: CustomerGrade
  private let task: TaskType
  
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
