//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

enum TaskType: Int, CaseIterable {
  case deposit = 0
  case loan = 1
  
  var taskTime: Double {
    switch self {
    case .deposit:
      return 0.7
    case .loan:
      return 0.3
    }
  }
  
  static func random() -> Self? {
    return allCases.randomElement()
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
