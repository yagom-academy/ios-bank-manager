//
//  BankingType.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/27.
//

import Foundation

enum BankingType: String, CaseIterable {
  case deposit = "예금"
  case loan = "대출"
  
  var requiredTime : Double {
    switch self {
    case .deposit:
      return 0.7
    case .loan:
      return 1.1
    }
  }
}
