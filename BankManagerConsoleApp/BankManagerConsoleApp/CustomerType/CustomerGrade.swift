//
//  CustomerGrade.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

enum CustomerGrade: Int {
  case vvip = 0
  case vip = 1
  case normal = 2
  
  var queuePriority: Operation.QueuePriority {
    switch self {
    case .vvip:
      return .veryHigh
    case .vip:
      return .normal
    case .normal:
      return .veryLow
    }
  }
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
