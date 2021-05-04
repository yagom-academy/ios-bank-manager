//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

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
